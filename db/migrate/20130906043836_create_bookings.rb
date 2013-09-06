class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.datetime :booked_at
      t.string :trip_id, null: false
      t.string :status, null: false, default: "bounced"
      t.decimal :total, null: false
      t.decimal :processing_fee, null: false
      t.decimal :service_tax, null: false
      t.string :transaction_number
      t.string :card_holder_name

      t.timestamps
    end
  end
end
