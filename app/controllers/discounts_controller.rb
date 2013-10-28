class DiscountsController < ApplicationController
  def index
    @discount = Discount.where(code: params[:code]).first()
    @trip = Trip.find(params[:trip])
    @booking = Booking.where(:trip_id => params[:trip]).first()
    @booking.discount_amount = @booking.total if @discount.amount >=@booking.total
    @booking.discount_amount = @discount.amount if @discount.amount <= @booking.total
    @booking.save

    @offer = Offer.find(@trip.offer_id)
    respond_to do |format|
      format.js {
        @content = render_to_string(:partial => 'payment').gsub("\"","'").gsub("\n","\\")
      }
    end
  end
end
