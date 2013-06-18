class ConvertForeignkeysOfOffers < ActiveRecord::Migration
  def up
  	change_column :translations, :offer_id, :string, :length => 6
  	change_column :photos, :offer_id, :string, :length => 6
  end

  def down  	
  	change_column :translations, :offer_id, :integer
  	change_column :photos, :offer_id, :integer
  end
end
