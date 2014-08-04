class OfferreviewsController < ApplicationController

	def index
		@reviews = Offerreview.includes(:user).includes(:offer).all

	end

	def new
		@review = Offerreview.new
	end


	def create

		@review = current_user.offerreviews.new(params[:offerreview])
		@review.trip_id = params[:trip_id]
		@trip = Trip.find(params[:trip_id])
		@review.offer_id = @trip.offer_id
		if @review.save!
			redirect_to offer_path(@trip.offer_id) , :notice  => "Review Submitted succesfully."
		else
			redirect_to  offer_path(@trip.offer_id) , :notice  => "Sorry we couldn't update your review.Might be a system error or You already have given your valuable reviews for your trip!!!"
		end		

	end


end