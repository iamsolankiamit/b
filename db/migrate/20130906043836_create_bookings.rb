class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.datetime :booked_at
      t.string :trip_id, null: false
      t.string :status, null: false, default: "bounced"
      t.decimal :total, null: false
      t.decimal :processing_fee, null: false
      t.decimal :service_tax, null: false
      t.decimal :weekly_rate_amount
      t.decimal :monthly_rate_amount
      t.decimal :nightly_rate_amount, null: false
      t.decimal :service_charge_amount
      t.decimal :extra_guest_charge_amount
      t.integer :included_guest_count
      t.decimal :per_night, null: false
      t.string :transaction_number
      t.string :card_holder_name

      t.timestamps
    end
  end
end
