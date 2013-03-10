class Address < ActiveRecord::Base
  attr_accessible :address_line_2, :city, :country_iso, :lat, :lng, :street, :zip
  belongs_to :offer
end
