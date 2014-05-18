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
      end
      redirect_to :back, :notice  =>  "Trip accepted, guest has been notified"
    end
  end
end
