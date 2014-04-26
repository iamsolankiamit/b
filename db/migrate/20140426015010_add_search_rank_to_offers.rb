class AddSearchRankToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :search_rank, :integer, :default => 0
    Offer.reset_column_information
    Offer.update_all(:search_rank => 0)
  end
end
