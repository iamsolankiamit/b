class HomeController < ApplicationController
  def index
		@offers = Offer.where(visiblity: true, is_verified: true).order("RANDOM()").limit(12).includes(:translations,:photos)
    @recently_viewed_offers = Offer.where(id: session[:recently_viewed_offers]).limit(4) if session[:recently_viewed_offers]
  end
end
