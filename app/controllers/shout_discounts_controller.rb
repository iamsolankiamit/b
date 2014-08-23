class ShoutDiscountsController < ApplicationController

	def create
		params[:shout_discounts][:offer_ids].each do |offer_id|
			unless offer_id == ""
			@shouts = ShoutDiscount.create!(shout_id: params[:shout_discounts][:shout_id], user_id: params[:shout_discounts][:user_id], offer_id: offer_id)
			end
		end
		redirect_to "/shouts/available"
	#this is been created at the /shout_discounts that is calling the POST shout_discounts#create action
	end

	def show
		@offers = current_user.offers.all
		@shouts = Shout.joins(:shout_discount)
		ActiveRecord::Associations::Preloader.new(@shouts, :shout_discount).run
	end

	 def index
	 	@shout = ShoutDiscount.includes(:shout).all
	 end

end