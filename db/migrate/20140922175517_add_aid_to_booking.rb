class AddAidToBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :aid, :string
  end
end
