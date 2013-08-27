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

  


  def to_jq_upload
    {
      "name" => read_attribute(:image_file_name),
      "size" => read_attribute(:image_file_size),
      "url" => image.url(:original),
      "delete_url" => offer_photo_path(self.offer_id,self),
      "delete_type" => "DELETE"
    }
  end
end
