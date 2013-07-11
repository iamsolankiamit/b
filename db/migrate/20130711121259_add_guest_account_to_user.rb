class AddGuestAccountToUser < ActiveRecord::Migration
  def change
    add_column :users, :guest_account, :boolean
  end
end
