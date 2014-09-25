class AddListerIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :lister_id, :integer
  end
end
