class HomeController < ApplicationController
  def index
		@offers = Offer.where(visiblity: true, is_verified: true).order("RANDOM()").limit(12).includes(:translations,:photos)
  end
end
