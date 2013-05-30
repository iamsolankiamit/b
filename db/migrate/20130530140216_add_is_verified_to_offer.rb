class AddIsVerifiedToOffer < ActiveRecord::Migration
  def change
    add_column :offers, :is_verified, :boolean, :default => false
  end
end
