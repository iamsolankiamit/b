class CalendarsController < ApplicationController
  def edit
    @offer = current_user.offers.find(params[:offer_id])
    @calendar = Calendar.find_by_offer_id(params[:offer_id])
  end
end
