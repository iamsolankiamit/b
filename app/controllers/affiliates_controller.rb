class AffiliatesController < ApplicationController

  before_filter :authenticate_user!
  load_and_authorize_resource
  def index
    @affiliate = current_user.affiliate
    if @affiliate
      @bookings = Booking.includes(trip: :guest).where(aid: @affiliate.a_id, status: "success")
    else
      redirect_to :root, :notice => "Either the page does not exist or you are not authourized to access it."
    end
  end
end
