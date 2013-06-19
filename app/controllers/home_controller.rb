class HomeController < ApplicationController
  def index
  	@offers = Offer.where(:visiblity => true, :is_verified => true).order(:created_at)
  end
end
