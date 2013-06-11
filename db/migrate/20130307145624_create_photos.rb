class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :offer_id
      t.text :description
      t.integer :offer_id
      t.attachment :image
      t.timestamps
    end
  end
end
