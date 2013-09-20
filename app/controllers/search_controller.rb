class SearchController < ApplicationController
  def index
    @offers =Offer.near(params[:destination], 50, :order => :distance).where(:is_verified => true)
    @json =@offers.to_gmaps4rails
  end
end
