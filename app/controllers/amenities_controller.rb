class AmenitiesController < ApplicationController
	def edit
		@offer = current_user.offers.find(params[:offer_id])
	end
end