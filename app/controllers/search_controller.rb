class SearchController < ApplicationController
  def index
  	@offers =Offer.search(params[:destination])

  	#@photos = Photo.find(:all,:conditions => ['offer_id = ?', @offers.first.id])
  	#@translations = Translation.find(:all,:conditions => ['offer_id = ? and locale="en"', @offers.first.id])
  end
end
