class CreatePayouts < ActiveRecord::Migration
  def change
    create_table :payouts do |t|
      t.integer :booking_id
      t.integer :trip_id
      t.integer :guest_id
      t.integer :transfer_no
      t.float :commission
      t.string :status
      t.timestamps
    end
  end
end
