class CreatePackageBookings < ActiveRecord::Migration
  def change
    create_table :package_bookings do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :unit_count
      t.integer :package_id
      t.integer :total
      t.string :status
      t.date :booked_at
      t.string :card_holder_name
      t.integer :transaction_number
      t.integer :guest_count

      t.timestamps
    end
  end
end
