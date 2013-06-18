class IntToBigintOffers < ActiveRecord::Migration
  def up
  	change_column :offers, :contact_phone, :bigint
  	change_column :offers, :contact_phone_backup, :bigint
  end

  def down
  	change_column :offers, :contact_phone, :integer
  	change_column :offers, :contact_phone_backup, :integer
  end
end
