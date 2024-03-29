class Trip < ActiveRecord::Base
  attr_accessible  :checkin, :checkout, :guest_count, :guest_id, :guest_visited, :host_accepted, :host_id, :offer_id
  has_one :general_discount
  has_one :booking
  belongs_to :offer
  belongs_to :guest , class_name: "User"
  belongs_to :host, class_name: "User"
  validates_presence_of :offer_id, :guest_id, :host_id, :guest_count

  has_many :review

end
