class AddDiscountIdToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :discount_id, :integer, :default => 0
  end
end
