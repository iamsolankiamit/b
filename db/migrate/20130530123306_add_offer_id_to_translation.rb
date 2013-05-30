class AddOfferIdToTranslation < ActiveRecord::Migration
  def change
    add_column :translations, :offer_id, :integer
  end
end
