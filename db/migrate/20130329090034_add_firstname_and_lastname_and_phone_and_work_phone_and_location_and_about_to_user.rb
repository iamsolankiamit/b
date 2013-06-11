class AddFirstnameAndLastnameAndPhoneAndWorkPhoneAndLocationAndAboutToUser < ActiveRecord::Migration
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :phone, :string
    add_column :users, :work_phone, :string
    add_column :users, :location, :string
    add_column :users, :about, :text

    add_column :users, :vat_id_number, :string
    add_column :users, :vat_company_name, :string
    add_column :users, :vat_country_iso, :string

    add_column :users, :role, :string
    
  end
end
