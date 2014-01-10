class Message < ActiveRecord::Base
  attr_accessible :content, :delete_receiver, :delete_sender, :read, :reciever_id, :sender_id, :subject
  validates_presence_of :subject, :message => "Enter the Subject"

  belongs_to :sender,
    :class_name => 'User',
    :foreign_key => 'sender_id'
  belongs_to :recepient,
    :class_name => 'User',
    :foreign_key => 'reciever_id'

  def mark_deleted(id, user_id)
    self.delete_sender = true if self.sender_id == user_id and self.id = id
    self.delete_receiver = true if self.reciever_id == user.id and self.id = id
    self.delete_sender && self.delete_receiver ? self.destory : save!
  end

  def reading(id, reader)
    if self.read == false? && (self.reciever_id == reader)
      self.read ||= 1
      self.save!
    end
    self
  end

end
