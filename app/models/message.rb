class Message < ActiveRecord::Base
  attr_accessible :content, :inquiry_id, :receiver_id, :sender_id
  belongs_to :sender , class_name: "User", foreign_key: "sender_id"
  belongs_to :receiver , class_name: "User", foreign_key: "receiver_id"
  validates_presence_of :sender_id, :receiver_id, :content 
  belongs_to :inquiry

end
