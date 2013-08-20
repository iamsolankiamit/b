class HomeController < ApplicationController
  def index
		@offers = Offer.where(visiblity: true)
  end
end
