class ChangeAccountNoTypeOfUsers < ActiveRecord::Migration
  def up
    change_column :users, :account_no, :string
  end

  def down
  end
end
