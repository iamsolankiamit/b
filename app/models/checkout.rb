class Checkout < ActiveRecord::Base
  attr_accessible :cancellation_policy,
    :check_in, 
    :check_out, 
    :email, 
    :guest_id, :host_id, :offer_id, :phone, :processing_fee, :service_tax, :total, :host_accepted, :guest_count, :status, :booked_at
  has_one :offer
  belongs_to :guest , :class_name => "User"
  belongs_to :host , :class_name => "User"

  def set_values(offer_id,check_in,check_out,guests, guest_id)
    self.offer_id = offer_id
    self.guest_id = guest_id
    self.check_in = check_in
    self.check_out = check_out
    self.guest_count = guests
    offer= Offer.find(self.offer_id)
    self.host_id = offer.user_id
    self.email = offer.email
    self.phone = offer.contact_phone
#   @number_of_days = (self.check_out - self.check_in).to_i
#   @host_charge = offer.nightly_charge_amount*@number_of_days
#   @processing_fee = @host_charge*0.05
#   @service_tax = @processing_fee*0.12
#   @total = @host_charge + @processing_fee + @service_tax
    self.processing_fee =3.0 # @processing_fee
    self.service_tax = 2.0 #@service_tax
    self.total =10.0 # @total
    self.cancellation_policy = offer.cancelation_policy
    self.save!
  end
end
