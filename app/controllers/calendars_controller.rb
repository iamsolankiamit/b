class CalendarsController < ApplicationController
  def edit
    @offer = current_user.offers.find(params[:offer_id])
        @calendar = ::EventCal::Calendar.new(Date.today)
  end
end
