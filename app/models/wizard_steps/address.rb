class Offer::Address < Offer
  validates :address_addon, :street, :street_no, :city, :country_code_iso, :presence => true
end
