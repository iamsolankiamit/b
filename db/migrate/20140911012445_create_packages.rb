class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.string :address_line_2
      t.string :address_Line_1
      t.string :email
      t.string :phone
      t.integer :bathroom_count
      t.integer :room_count
      t.integer :pax_count
      t.integer :price
      t.text :facilities
      t.integer :unit_count
      t.integer :extra_person_allowed_count
      t.integer :extra_person_charge
      t.integer :checkin
      t.integer :checkout
      t.integer :max_guest
      t.integer :package_rate

      t.timestamps
    end
  end
end
