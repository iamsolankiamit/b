class SearchController < ApplicationController
	def index

		
 		@offers ||= find_offers.page params[:page]
 	#	@offers =Offer.near(params[:destination], 50).sorted

		
		@price_min = Offer.near(params[:destination], 50).minimum(:nightly_rate_amount)
 		@price_max = Offer.near(params[:destination], 50).maximum(:nightly_rate_amount)

 		@offers = find_amenities if params[:amenities]

 		# @offers = @offers.order('search_rank DESC')
 		cookies[:checkin] = params[:checkin] unless params[:checkin].nil?
 		cookies[:checkout] = params[:checkout] unless params[:checkout].nil?

 	end

 	def search
 		destination = params[:destination].gsub(/, /,'-').gsub(/ /,'-')

 		price_min = params[:price_min].to_i
 		price_max = params[:price_max].to_i

 		if params[:amenities]
 		redirect_to search_path(destination,guests: params[:guests],checkin: params[:checkin], checkout: params[:checkout], bedrooms: params[:bedrooms], price_min: params[:price_min] , price_max: params[:price_max] , bed_count: params[:bed_count] , bed_type: params[:bed_type] , max_guest_count: params[:max_guest_count] , amenities: { breakfast: params[:amenities][:breakfast] ,air_conditioning: params[:amenities][:air_conditioning] , smoking_allowed: params[:amenities][:smoking_allowed], cable_tv: params[:amenities][:cable_tv] , internet: params[:amenities][:internet] , kitchen: params[:amenities][:kitchen]  })

else
 		redirect_to search_path(destination,guests: params[:guests],checkin: params[:checkin], checkout: params[:checkout], bedrooms: params[:bedrooms], price_min: params[:price_min] , price_max: params[:price_max] , bed_count: params[:bed_count] , bed_type: params[:bed_type] , max_guest_count: params[:max_guest_count], search_sort: params[:search_sort] )
end                                                        

 	end




	# private methods


 	

 	private

 	def find_offers
 		Offer.near(params[:destination], 50).where(conditions).sorting(params[:search_sort])

 	end

 	def find_amenities
 		@offers = @offers.joins(:amenity).where(amenities_condition)
 		ActiveRecord::Associations::Preloader.new(@offers, :amenity).run
 		@offers
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
 		[' nightly_rate_amount >= ? ',params[:price_min]] if params[:price_min]  && params[:price_min] != 0 
 	end

 	def max_price_conditions
 		[' nightly_rate_amount <= ? ',params[:price_max]] if params[:price_max]  && params[:price_max] != 0 
 	end

 	def is_verified_conditions
 		[' is_verified = ?', true]
 	end

 	def bedcount_conditions
 		[' bed_count >= ?',params[:bed_count]] if params[:bed_count]  && params[:bed_count] != 0
  	end

  	def max_guest_conditions
  		[' max_guest_count >= ?' ,params[:max_guest_count]] if params[:max_guest_count] && params[:max_guest_count] != 0
  	end

  	def bedtype_conditions
  		[' bed_type LIKE ?' ,params[:bed_type]] if params[:bed_type]  && params[:bed_type] != ''
  	end

  



#------------------------------------------------------------------------------------------------------

  	def amenities_condition
 		functions = private_methods(false).grep(/_amenity_condition$/).map { |m| send(m) }.compact
 		conditions_parts_amen = functions
 		x=conditions_parts_amen.map { |condition| condition.first }
 		y=functions.map{ |condition| condition[-1..1] }.flatten
[x.join('AND'),*y]         # * represents the block as intake
  	end

  	def breakfast_amenity_condition
  		[' amenities.breakfast = ? ', true ] if (params[:amenities][:breakfast] == "true")  
  	end
  	def air_conditioning_amenity_condition
  		[' amenities.air_conditioning = ? ', true ] if (params[:amenities][:air_conditioning] == "true")  
  	end
  	def smoking_allowed_amenity_condition
  		[' amenities.smoking_allowed = ? ', true ] if (params[:amenities][:smoking_allowed] == "true")  
  	end
  	
  	def cable_tv_amenity_condition
  		[' amenities.cable_tv = ? ', true ] if (params[:amenities][:cable_tv] == "true")  
  	end

  	def Internet_amenity_condition
  		[' amenities.internet = ? ', true ] if (params[:amenities][:internet] == "true")  
  	end

  	def Kitchen_amenity_condition
  		[' amenities.kitchen = ? ', true ] if (params[:amenities][:kitchen] == "true")  
  	end

end