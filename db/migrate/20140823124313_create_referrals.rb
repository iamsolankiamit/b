class CreateReferrals < ActiveRecord::Migration
  def change
    create_table :referrals do |t|
      t.integer :referer_id
      t.integer :referee_id
      t.integer :referer_reward_id
      t.integer :referee_reward_id

      t.timestamps
    end
  end
end
