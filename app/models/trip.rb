class Trip < ActiveRecord::Base
<<<<<<< HEAD
  attr_accessible :card_holder_name, :total, :transaction_number
  has_one :checkout
=======
  attr_accessible  :checkin, :checkout, :guest_count, :guest_id, :guest_visited, :host_accepted, :host_id, :offer_id
  belongs_to :offer
  belongs_to :guest , class_name: "User"
  belongs_to :host, class_name: "User"
  validates_presence_of :offer_id, :guest_id, :host_id, :guest_count

>>>>>>> implement-payment-gateway
end
