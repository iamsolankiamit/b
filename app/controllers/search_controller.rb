class SearchController < ApplicationController
  def index
    @offers =Offer.near(params[:destination], 50, :order => :distance).where(:is_verified => true)
    #   @json =@offers.to_gmaps4rails
    cookies[:checkin] = params[:checkin] unless params[:checkin].nil?
    cookies[:checkout] = params[:checkout] unless params[:checkout].nil?
    @hash = Gmaps4rails.build_markers(@offers) do |offers, marker|
      marker.lat offers.confidential_lat
      marker.lng offers.confidential_lng
    end
  end

  def search
    destination = params[:destination].gsub(/, /,'-')
    redirect_to search_path(destination,guests: params[:guests],checkin: params[:checkin], checkout: params[:checkout], bedrooms: params[:bedrooms])
  end
end
