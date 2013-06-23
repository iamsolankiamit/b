class CreateFloods < ActiveRecord::Migration
  def change
    create_table :floods do |t|
      t.string :firstname
      t.string :lastname
      t.string :address
      t.string :city
      t.string :email
      t.integer :accommodates
      t.decimal :phone

      t.timestamps
    end
  end
end
