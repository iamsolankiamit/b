class Offerreview < ActiveRecord::Base

attr_accessible :user_id,:trip_id,:offer_id,:content

validates_uniqueness_of :trip_id

belongs_to :trip     #as here this holds one to one relationship
belongs_to :offer  	 #as here one to many relationship holds
belongs_to :user 	 #as here also one to many relationship holds


end


