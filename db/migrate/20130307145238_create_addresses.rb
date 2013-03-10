class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :address_line_2
      t.string :city
      t.integer :zip
      t.string :country_iso
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end
