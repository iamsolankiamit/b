class HomeController < ApplicationController
  def index
  	@offers = Offer.where(donate: true, full:false)
  end
end
