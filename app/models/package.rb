class Package < ActiveRecord::Base
  attr_accessible :address_Line_1, :address_line_2, :bathroom_count, :checkin, :checkout, :email, :extra_person_allowed_count, :extra_person_charge, :facilities, :max_guest, :package_rate, :pax_count, :phone, :price, :room_count, :unit_count
  has_many :package_photos, :dependent => :destroy
end
