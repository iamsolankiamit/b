class SearchController < ApplicationController
  def index
    @offers =Offer.near(params[:destination], 50, :order => :distance).where(:is_verified => true)
    #   @json =@offers.to_gmaps4rails
    @hash = Gmaps4rails.build_markers(@offers) do |offers, marker|
      marker.lat offers.confidential_lat
      marker.lng offers.confidential_lng
    end
  end
end
