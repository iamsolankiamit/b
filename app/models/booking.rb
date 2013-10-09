class Booking < ActiveRecord::Base
  attr_accessible :booked_at, :card_holder_name, :processing_fee, :service_tax, :status, :total, :transaction_number, :trip_id, :weekly_rate, :nightly_rate_amount, :monthly_rate_amount, :included_guest_count, :extra_guest_charge_amount, :service_charge_amount, :per_night
  belongs_to :trip
  def set_values(offer_id,checkin,checkout,guests,guest_id,trip_id)
    checkout = Date.strptime(checkout, "%m/%d/%Y")
    checkin = Date.strptime(checkin, "%m/%d/%Y")
    @number_of_days = (checkout - checkin).to_i
      @offer= Offer.find(offer_id)
      if @number_of_days >=30 && @offer.monthly_rate_amount
        @host_fee = @number_of_days*(@offer.monthly_rate_amount/30)
      elsif @number_of_days >=7 && @offer.weekly_rate_amount
        @host_fee = @number_of_days*(@offer.weekly_rate_amount/7)
      else
        @host_fee = @number_of_days*@offer.nightly_rate_amount
      end
      self.per_night = @host_fee/@number_of_days
      self.included_guest_count = @offer.included_guest_count
      self.extra_guest_charge_amount = @offer.extra_guest_charge_amount
      self.service_charge_amount = @offer.service_charge_amount
      self.nightly_rate_amount = @offer.nightly_rate_amount
      self.weekly_rate_amount = @offer.weekly_rate_amount
      self.monthly_rate_amount = @offer.monthly_rate_amount
      if @offer.service_charge_amount
        @host_fee += @offer.service_charge_amount
      end
      if @offer.included_guest_count && guests.to_i > @offer.included_guest_count
        @host_fee += (guests.to_i - @offer.included_guest_count)*@offer.extra_guest_charge_amount
      end
      @processing_fee = @host_fee*0.08
      @service_tax = @processing_fee*0.12
      @total = @processing_fee + @host_fee + @service_tax
      self.total = @total
      self.service_tax = @service_tax
      self.processing_fee = @processing_fee
      self.trip_id = trip_id
      self.save!
  end
end
