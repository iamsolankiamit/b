class RemoveDonateAndFullFromOffers < ActiveRecord::Migration
  def up
    remove_column :offers, :donate
    remove_column :offers, :full
  end

  def down
    add_column :offers, :full, :boolean
    add_column :offers, :donate, :boolean
  end
end
