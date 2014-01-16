class Conversation < ActiveRecord::Base
  attr_accessible :inquiry_id, :message_id
  belongs_to :inquiry
  has_many :messages
end
