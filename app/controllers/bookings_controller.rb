class BookingsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  skip_before_filter :verify_authenticity_token
  include ActiveMerchant::Billing::Integrations
  def new
  end

  def show
    @booking = Booking.find(params[:id])
    @trip = Trip.find(@booking.trip_id)
    if @booking.created_at - Time.now > 15.minutes && @booking.status == "bounced"
      redirect_to @trip
    end
    if @booking.status == "success"
      redirect_to @trip
    end
  end

  def create
    @booking = Booking.new
    @offer= Offer.find(params[ 'offer_id' ])
    @checkin = DateTime.strptime(params['checkin'], "%m/%d/%Y")
    @checkout= DateTime.strptime(params['checkout'], "%m/%d/%Y")
    @trip = Trip.create( offer_id: params['offer_id'],guest_id: current_user.id, host_id: @offer.user_id, checkin: @checkin,checkout: @checkout,guest_count: params[ 'guests' ])
    @trip.save!
    @booking.set_values(params['offer_id'],params['checkin'],params['checkout'],params['guests'],current_user.id, @trip.id)
    @guest = User.find(@trip.guest_id)
    redirect_to @booking
  end

  def payu_return
    notification = PayuIn.notification(request.query_string, options = {:credential1 => $payu_merchant_id, :credential2 => $payu_secret_key, :params => params})
    @booking = Booking.find(notification.invoice.to_i) # notification.invoice is order id/cart id which you have submited from payment direction page.
    if notification.acknowledge
      begin
        if notification.complete?
          @booking.status = 'success'
          @booking.booked_at = Time.now
          @booking.card_holder_name = params['name_on_card']
          @booking.transaction_number = notification.invoice
          @trip = Trip.find(@booking.trip_id)
          host = User.find(@trip.host_id)
          commission = @booking.total*0.05
          @payout = Payout.new(booking_id: @booking.id, trip_id: @trip.id, status: "Unpaid", guest_id: @trip.guest_id, commission: commission )
          @payout.save
          UserMailer.delay.host_acceptance(current_user,host,@trip,@booking)
          UserMailer.delay.guest_booking_done(current_user,@trip,@booking)
          user_sms = SmsSender.new(current_user,host,@trip,@booking)
          redirect_to @trip
        else
          @booking.status = "failed"
          render :text =>"Order Failed! MD5 Hash does not match!"
        end
      ensure
        @booking.save
      end
    end
  end
end
