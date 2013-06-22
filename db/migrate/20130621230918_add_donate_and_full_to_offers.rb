class AddDonateAndFullToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :donate, :boolean, default: false
    add_column :offers, :full, :boolean, default: false
  end
end
