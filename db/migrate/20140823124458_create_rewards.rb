class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.float :reward_amount , :default => 0.0, null: false
      t.integer :rewardee_id
      t.boolean :used, default: false, null: false
      t.datetime :used_on
      t.integer :trip_id

      t.timestamps
    end
  end
end
