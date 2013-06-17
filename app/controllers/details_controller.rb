class DetailsController < ApplicationController
  def edit
  	@offer = current_user.offers.find(params[:offer_id])
  end

  def update
  	@offer = current_user.offers.find(params[:offer_id])
    if @offer.update_attributes(params[:offer])
      redirect_to edit_offer_addresses_path(@offer.id), :notice  => "Successfully updated offer's Details."
    else
      render :edit
    end
  end
end
