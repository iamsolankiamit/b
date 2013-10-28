class AddDiscountAmountToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :discount_amount, :float, :default => 0
  end
end
