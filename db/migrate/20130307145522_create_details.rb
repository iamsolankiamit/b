class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.string :email
      t.integer :phone
      t.integer :alternate
      t.integer :size
      t.string :property_type
      t.integer :bathrooms
      t.integer :accomodation
      t.integer :beds
      t.integer :bedroom
      t.string :bed_type

      t.timestamps
    end
  end
end
