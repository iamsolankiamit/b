class CreatePricings < ActiveRecord::Migration
  def change
    create_table :pricings do |t|
      t.decimal :night
      t.decimal :week
      t.decimal :month
      t.decimal :extra_on_person
      t.decimal :cleaning
      t.integer :extra_after
      t.integer :min_stay
      t.integer :max_stay
      t.string :cancellation_policy
      t.integer :checkin_after
      t.integer :checkout_before

      t.timestamps
    end
  end
end
