class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :offer_id, null: false
      t.integer :guest_id, null: false
      t.integer :host_id, null: false
      t.date :checkin
      t.date :checkout
      t.integer :guest_count, null: false, default: 2
      t.string :booking_id, null: false
      t.string :cancelation_policy, null: false, default: "strict"
      t.boolean :host_accepted, null: false, default: false
      t.boolean :guest_visited, null: false, default: false

      t.timestamps
    end
  end
end
