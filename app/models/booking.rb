class Booking < ActiveRecord::Base
  attr_accessible :booked_at, :card_holder_name, :processing_fee, :service_tax, :status, :total, :transaction_number, :trip_id
  belongs_to :trip

  def set_values(offer_id,checkin,checkout,guests,guest_id,trip_id)
    @offer= Offer.find(offer_id)
    checkout = Date.strptime(checkout, "%m/%d/%Y")
    checkin = Date.strptime(checkin, "%m/%d/%Y")
    @number_of_days = (checkout - checkin).to_i
    @host_fee = @number_of_days*@offer.nightly_rate_amount
    @processing_fee = @number_of_days*@offer.nightly_rate_amount*0.05
    @service_tax = @processing_fee*0.12
    @total = @processing_fee + @host_fee + @service_tax
    self.total = @total
    self.service_tax = @service_tax
    self.processing_fee = @processing_fee
    self.trip_id = trip_id
    self.save!
  end
end
