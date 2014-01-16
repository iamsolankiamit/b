class Inquiry < ActiveRecord::Base
  attr_accessible :check_in, :check_out, :conversation_id, :guest_count, :offer_id, :receiver_id, :sender_id
  has_many :messages
  belongs_to :sender , class_name: "User", foreign_key: "sender_id"
  belongs_to :receiver , class_name: "User", foreign_key: "receiver_id"
  belongs_to :offer

  validates_presence_of :offer_id, :sender_id, :receiver_id
end
