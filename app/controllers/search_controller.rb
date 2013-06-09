class SearchController < ApplicationController
  def index
  	@offers =Offer.search(params[:search])
  end
end
