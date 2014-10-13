class CreateAffiliates < ActiveRecord::Migration
  def change
    create_table :affiliates do |t|
      t.integer :a_id
      t.string :name
      t.belongs_to :user

      t.timestamps
    end
    add_index :affiliates, :user_id
  end
end
