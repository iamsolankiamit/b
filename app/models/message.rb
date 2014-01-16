class Message < ActiveRecord::Base
  attr_accessible :content, :delete_s, :delete_r, :inquiry_id

  belongs_to :inquiry
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
