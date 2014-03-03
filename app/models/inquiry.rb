class Inquiry < ActiveRecord::Base
  attr_accessible :check_in, :host_id, :guest_id, :check_out, :guest_count, :offer_id , :messages_attributes
  has_many :messages
  accepts_nested_attributes_for :messages

 belongs_to :offer
 belongs_to :host , class_name: "User", foreign_key: "host_id"
 belongs_to :guest , class_name: "User", foreign_key: "guest_id"

  validates_presence_of :offer_id, :check_out, :check_in, :guest_count
end
