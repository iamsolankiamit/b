class Referral < ActiveRecord::Base
  attr_accessible :referee_id, :referee_reward_id, :referer_id, :referer_reward_id

  belongs_to :referee, class_name: "User"
  belongs_to :referer, class_name: "User"

  after_create :setup_rewards

  has_many :referal_email

  private

  def setup_rewards
  	referer_rewards = Reward.new(rewardee_id: :referer_id)
  	referer_rewards.save!
  	referee_rewards = Reward.new(rewardee_id: :referee_id)
  	referee_rewards.save!
  end

end
