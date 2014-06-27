class Payout < ActiveRecord::Base
  attr_accessible   :booking_id, :commission, :guest_id, :host_id, :status, :transfer_no, :trip_id
  belongs_to :booking
  belongs_to :trip
end
