class HomeController < ApplicationController
  def index
		@offers = Offer.where(visiblity: true, is_verified: true).order("RANDOM()").limit(4).includes(:translations,:photos)
    @recently_viewed_offers = Offer.where(id: session[:recently_viewed_offers], visiblity: true, is_verified: true).includes(:translations,:photos).limit(4) if session[:recently_viewed_offers]
  end
end
