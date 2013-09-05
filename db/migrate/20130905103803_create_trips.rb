class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :card_holder_name
      t.string :transaction_number, :null => false
      t.decimal :total, :null => false
      t.integer :checkout_id, :null =>false
      t.timestamps
    end
  end
end
