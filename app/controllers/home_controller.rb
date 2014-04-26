class HomeController < ApplicationController
  def index
		@offers = Offer.where(visiblity: true, is_verified: true).order("RANDOM()").limit(5).includes(:translations,:photos)
    @recently_viewed_offers = Offer.where(id: session[:recently_viewed_offers]).limit(5) if session[:recently_viewed_offers]
  end
end
