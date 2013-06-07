class Photo < ActiveRecord::Base
  attr_accessible :description, :offer_id, :image
  has_attached_file :image, 
    :styles => { 
      :medium => "300x300>", 
      :thumb => "100x100>" 
    }, 
    :default_url => "/images/photo/:style/no-image.jpg",
    :storage => :s3,
    :bucket => 'roomnhouse-assets',
    :s3_credentials => {
      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
    }

  belongs_to :offers
end
