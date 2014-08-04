class Offer::Address < Offer
  validates_presence_of :address_addon, :street, :street_no, :city, :country_code_iso
end
