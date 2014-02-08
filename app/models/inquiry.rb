class Inquiry < ActiveRecord::Base
  attr_accessible :check_in, :check_out, :guest_count, :offer_id , :messages_attributes
  has_many :messages
  accepts_nested_attributes_for :messages

 belongs_to :offer

  validates_presence_of :offer_id, :check_out, :check_in, :guest_count
end
