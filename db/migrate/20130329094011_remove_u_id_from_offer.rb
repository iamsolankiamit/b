class RemoveUIdFromOffer < ActiveRecord::Migration
  def up
    remove_column :offers, :u_id
  end

  def down
    add_column :offers, :u_id, :string
  end
end
