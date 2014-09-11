class PackageBooking < ActiveRecord::Base
  attr_accessible :email, :name, :package_id, :phone, :total, :unit_count, :status, :booked_at, :card_holder_name, :transaction_number, :guest_count

  validates_presence_of :email, :name, :phone, :total, :unit_count, :package_id
  belongs_to :package
end
