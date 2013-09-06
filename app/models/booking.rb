class Booking < ActiveRecord::Base
  attr_accessible :booked_at, :card_holder_name, :processing_fee, :service_tax, :status, :total, :transaction_number
  belongs_to :trip
end
