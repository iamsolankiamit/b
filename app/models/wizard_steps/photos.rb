class Offer::Photo < Photo
  validates_attachment_content_type :image, :content_type => /\Aimage/
end
