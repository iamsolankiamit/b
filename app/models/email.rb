class Email < ActiveRecord::Base
  attr_accessible :email_doc, :file
  has_attached_file :email_doc,
  :default_url => "/:style/no-image.jpg",
    :storage => :s3,
    :bucket => 'roomnhouse-assets',
    :s3_credentials => {
      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
    },
    url: ':s3_alias_url',
    s3_host_alias: 'dm1w09da1rt65.cloudfront.net',
    :path => "/:class/:attachment/:id_partition/:style/:filename"

  has_attached_file :file,
  :default_url => "/:style/no-image.jpg",
    :storage => :s3,
    :bucket => 'roomnhouse-assets',
    :s3_credentials => {
      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
    },
    url: ':s3_alias_url',
    s3_host_alias: 'dm1w09da1rt65.cloudfront.net',
    :path => "/:class/:attachment/:id_partition/:style/:filename"

    validates_attachment_content_type :file, :content_type => /\Aapplication\/vnd\.ms\-excel|application\/vnd\.openxmlformats\-officedocument\.spreadsheetml\.sheet|text\/csv\r\n|text\/csv\n|text\/csv|text|application\/x\-empty/
    validates_attachment_content_type :email_doc, :content_type => /\Atext\/html|application\/zip/

end
