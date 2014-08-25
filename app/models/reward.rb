class Reward < ActiveRecord::Base
  attr_accessible :reward_amount, :rewardee_id, :trip_id, :used, :used_on

  belongs_to :trip
  belongs_to :rewardee , class_name: "User"

  def initialize
  	self.reward_amount = 500.0
  end
  def used?
  	self.used
	end

end
