class IncreasePhoneNoLimitOnUser < ActiveRecord::Migration
  def up
    change_column :users, :phone, :string
    change_column :users, :work_phone, :string
    change_column :offers, :contact_phone, :string
    change_column :offers, :contact_phone_backup, :string
  end

  def down
  end
end
