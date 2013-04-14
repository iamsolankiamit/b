class AddFirstnameAndLastnameAndPhoneAndWorkPhoneAndLocationAndAboutToUser < ActiveRecord::Migration
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :phone, :string
    add_column :users, :work_phone, :string
    add_column :users, :location, :string
    add_column :users, :about, :text
  end
end
