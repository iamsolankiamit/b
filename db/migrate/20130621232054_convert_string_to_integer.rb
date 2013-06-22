class ConvertStringToInteger < ActiveRecord::Migration
  def up
  	remove_column :users, :phone
  	add_column :users, :phone, :bigint
  	remove_column :users, :work_phone
  	add_column :users, :work_phone, :bigint
  	remove_column :users, :vat_id_number
  	add_column :users, :vat_id_number, :integer
  end

  def down
  	change_column :users, :phone, :string
  	change_column :users, :work_phone, :string
  	change_column :users, :vat_id_number, :string
  end
end
