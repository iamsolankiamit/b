class TripsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  def index
    if current_user
    @trips = Trip.where(guest_id: current_user.id)
    else
      redirect_to offers_url
    end
  end

  def show
    @trip = Trip.where(guest_id: current_user.id, trip_id: params[:id])
  end
end
