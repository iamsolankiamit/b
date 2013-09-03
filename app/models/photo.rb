class Photo < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  attr_accessible :description, :offer_id, :image
  has_attached_file :image, 
    :styles => { 
    :slider1 => "720x550#",
    :slider2 => "720x550>",
    :homeimage => "310x185#",
    :medium => "300x300#", 
    :thumb => "100x100#" 
  }, 
  :default_url => "/images/photo/:style/no-image.jpg",
  :storage => :s3,
  :bucket => 'roomnhouse-assets',
  :s3_credentials => {
    :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
    :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
  },
  :url => ':s3_domain_url',
  :path => "/:class/:attachment/:id_partition/:style/:filename"

  belongs_to :offers

  # Environment-specific direct upload url verifier screens for malicious posted upload locations.
  DIRECT_UPLOAD_URL_FORMAT = %r{\Ahttps:\/\/s3-ap-southeast-1\.amazonaws\.com\/roomnhouse-assets#{!Rails.env.production? ? '' : ''}\/(?<path>uploads\/.+\/(?<filename>.+))\z}.freeze
  validates :direct_upload_url, presence: true, format: { with: DIRECT_UPLOAD_URL_FORMAT }

  before_create :set_upload_attributes
  after_create :queue_processing

  attr_accessible :direct_upload_url

  # Store an unescaped version of the escaped URL that Amazon returns from direct upload.
  def direct_upload_url=(escaped_url)
    write_attribute(:direct_upload_url, (CGI.unescape(escaped_url) rescue nil))
  end

  # Determines if file requires post-processing (image resizing, etc)
  def post_process_required?
    %r{^(image|(x-)?application)/(bmp|gif|jpeg|jpg|pjpeg|png|x-png)$}.match(image_content_type).present?
  end

  protected

  # Set attachment attributes from the direct upload
  # @note Retry logic handles S3 "eventual consistency" lag.
  def set_upload_attributes
    tries ||= 5
    direct_upload_url_data = DIRECT_UPLOAD_URL_FORMAT.match(direct_upload_url)
    s3 = AWS::S3.new
    direct_upload_head = s3.buckets[Rails.configuration.aws[:bucket]].objects[direct_upload_url_data[:path]].head

    self.image_file_name     = direct_upload_url_data[:filename]
    self.image_file_size     = direct_upload_head.content_length
    self.image_content_type  = direct_upload_head.content_type
    self.image_updated_at    = direct_upload_head.last_modified
  rescue AWS::S3::Errors::NoSuchKey => e
    tries -= 1
    if tries > 0
      sleep(3)
      retry
    else
      false
    end
  end

  # Queue file processing
  def queue_processing
    self.transfer_and_cleanup
    system("echo delayed >> logfile.log")
  end

  # Final upload processing step
  def transfer_and_cleanup
    system("echo working >> logfile.log")
    direct_upload_url_data = DIRECT_UPLOAD_URL_FORMAT.match(direct_upload_url)
    s3 = AWS::S3.new

    if post_process_required?
      self.image = URI.parse(URI.escape(direct_upload_url))
    else
      paperclip_file_path = "photos/images/#{id_parition}/original/#{direct_upload_url_data[:filename]}"
      s3.buckets[Rails.configuration.aws[:bucket]].objects[paperclip_file_path].copy_from(direct_upload_url_data[:path])
    end

    self.processed = true
    save!

    s3.buckets[Rails.configuration.aws[:bucket]].objects[direct_upload_url_data[:path]].delete
  end

end
