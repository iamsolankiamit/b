class SearchController < ApplicationController
	def index

 		@offers ||= find_offers
		
		@price_min = @offers.minimum(:nightly_rate_amount)
 		@price_max = @offers.maximum(:nightly_rate_amount)

 		# @offers = @offers.order('search_rank DESC')
 		cookies[:checkin] = params[:checkin] unless params[:checkin].nil?
 		cookies[:checkout] = params[:checkout] unless params[:checkout].nil?

 	end

 	def search
 		destination = params[:destination].gsub(/, /,'-').gsub(/ /,'-')

 		price_min = params[:price_min].to_i
 		price_max = params[:price_max].to_i
 		redirect_to search_path(destination,guests: params[:guests],checkin: params[:checkin], checkout: params[:checkout], bedrooms: params[:bedrooms], price_min: params[:price_min] , price_max: params[:price_max] , bed_count: params[:bed_count])
 	end




	# private methods


 	private

 	def find_offers
 		Offer.near(params[:destination], 50, :order => :distance).where(conditions).order('search_rank DESC')
 	end

 	def conditions
 		[conditions_clauses.join('AND') , *conditions_options]
 	end

 	def conditions_clauses
 		conditions_parts.map { |condition| condition.first }
 	end

 	def conditions_options
 		conditions_parts.map{ |condition| condition[-1..1] }.flatten
 	end

 	def conditions_parts
 		private_methods(false).grep(/_conditions$/).map { |m| send(m) }.compact
 	end




# below functions with "_condition" lastparts


 	def min_price_conditions
 		[' nightly_rate_amount >= ? ',params[:price_min]] if params[:price_min] 
 	end

 	def max_price_conditions
 		[' nightly_rate_amount <= ? ',params[:price_max]] if params[:price_max] 
 	end

 	def is_verified_conditions
 		[' is_verified = ?', true]
 	end

 	def bedcount_conditions
 		[' bed_count >= ?',params[:bed_count]] if params[:bed_count]
  	end


end