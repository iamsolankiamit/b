class CreateDiscounts < ActiveRecord::Migration
  def change
    create_table :discounts do |t|
      t.string :code, :null => false
      t.float :amount, :default => 0
      t.integer :min_nights
      t.integer :min_guests
      t.float :min_amount
      t.string :city
      t.date :from
      t.date :to

      t.timestamps
    end
  end
end
