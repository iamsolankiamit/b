class TripsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  def index
      @trips = Trip.where(guest_id: current_user.id)
  end

  def show
    @trip = Trip.where(guest_id: current_user.id, id: params[:id]).first
    @offer = Offer.find(@trip.offer_id)
    @host = User.find(@trip.host_id)
    @guest = User.find(@trip.guest_id)
  end

  def update
    @trip = Trip.find(params[:id])
    if @trip.update_attributes(params[:trip])
      unless :host_accepted.nil?
        UserMailer.delay.guest_notifier(@trip.id)
        # checkout = Date.strptime(@trip.checkout, "%Y/%m/%d")
        # created_at = Date.strptime(@trip.created_at, "%Y/%m/%d")
        # number_of_days = @trip.checkout.mjd - @trip.created_at.to_date.mjd
        # UserMailer.delay(run_at: number_of_days.days.from_now).trip_end(@trip.id)
      end
      redirect_to :back, :notice  =>  "Trip accepted, guest has been notified"
    end
  end
end



