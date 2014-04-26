class TranslationsController < ApplicationController
	def edit
		@offer = current_user.offers.find(params[:offer_id])
    if !@offer.translations
      @offer.build_translations
    end
	end

	def update
		@offer = current_user.offers.find(params[:offer_id])
    if @offer.update_attributes(params[:offer])
      redirect_to edit_offer_details_path(@offer.id), :notice  => "Successfully updated offer."
    else
      render :edit
    end
	end
end
