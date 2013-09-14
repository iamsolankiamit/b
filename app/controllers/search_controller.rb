class SearchController < ApplicationController
  def index
    result = Geocoder.search(params[:destination]).map(&:geometry)
    north_east_lat = result[0]["viewport"]["northeast"]["lat"]
    north_east_lng = result[0]["viewport"]["northeast"]["lng"]
    south_west_lat = result[0]["viewport"]["southwest"]["lat"]
    south_west_lng = result[0]["viewport"]["southwest"]["lng"]
    distance = Geocoder::Calculations.distance_between([north_east_lat,north_east_lng], [south_west_lat,south_west_lng])/2
  	@offers =Offer.near(params[:destination], distance, :order => :distance).where(:is_verified => true)

  	#@photos = Photo.find(:all,:conditions => ['offer_id = ?', @offers.first.id])
  	#@translations = Translation.find(:all,:conditions => ['offer_id = ? and locale="en"', @offers.first.id])
  end
end
