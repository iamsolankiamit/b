class CreateSunburnSystems < ActiveRecord::Migration
  def change
    create_table :sunburn_systems do |t|
      t.integer :booking_id
      t.date :booking_date
      t.string :name
      t.float :rate
      t.float :total
      t.float :fee
      t.float :feewopg
      t.float :commission

      t.timestamps
    end
  end
end
