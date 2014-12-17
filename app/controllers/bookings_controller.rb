class BookingsController < ApplicationController
  require 'uri'
  before_filter :authenticate_user! , except: [:new,:create,:show, :email]
  load_and_authorize_resource
  skip_before_filter :verify_authenticity_token
  include ActiveMerchant::Billing::Integrations


  def new
    @offer = Offer.includes(:photos, :translations).find(params[:offer_id])
    if params[:aid]
      cookies[:aid] = { value: params[:aid], expires: 1.hour.from_now }
    end
    if params[:guests].to_i > @offer.max_guest_count
      redirect_to @offer, notice: "maximum no of Guest allowed is #{@offer.max_guest_count}"
    else
      @requests = Booking.new.request_values(params[:offer_id],params[:checkin],params[:checkout],params[:guests])
      @total = Booking.new.request_values(params[:offer_id],params[:checkin],params[:checkout],params[:guests])
      respond_to do |format|
        format.html
        format.json {render json: @requests}
      end
    end
  end


  def show
    session.delete(:passthru)
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
    if params[:user][:email].blank? || params[:user][:phone].blank?
      redirect_to :back , notice: "Email and phone number can't be blank"
    else
      if current_user
        current_user.update_attributes(email: params[:user][:email], firstname: params[:user][:firstname], lastname: params[:user][:lastname])
        current_user.save!
        create_booking(current_user)
      else
        u = User.where(:email => params[:user][:email]).first
        unless u
          generated_password = Devise.friendly_token.first(8)
          u = User.create(:email => params[:user][:email],
            :firstname => params[:user][:firstname],
            :lastname => params[:user][:lastname],
            :password => generated_password)
        else
          u.update_attributes(email: params[:user][:email], firstname: params[:user][:firstname], lastname: params[:user][:lastname])
        end
        u.save!
        @booking = Booking.new
        session[:passthru] = bookings_path(@booking)
        create_booking(u)
        sign_in u
      end
      redirect_to @booking
    end
  end

  def email
    email = URI.decode(params[:e])
    token = params[:t]
    trip_id = params[:b]
    ans = params[:a]
    trip = Trip.find(trip_id)
    user = User.where(email: email).first
    if user.email_token == token
      if ans = y
        trip.host_accepted = true
        UserMailer.guest_notifier(trip_id)
      else
        trip.host_accepted = false if ans = n
      end
      user.email_token = ""
      sign_in_and_redirect(user, trips_path(trip), notice: "Your response is noted")
    else
      redirect_to :root, :notice => "You are not authorized"
    end

  end

  def create_booking(guest)
    @offer= Offer.find(params[:user][:offer_id])
    @checkin = DateTime.strptime(params[:user][:checkin], "%m/%d/%Y")
    @checkout= DateTime.strptime(params[:user][:checkout], "%m/%d/%Y")
    @trip = Trip.create( offer_id: params[:user][:offer_id],guest_id: guest.id, host_id: @offer.user_id, checkin: @checkin,checkout: @checkout,guest_count: params[:user][:guests])
    @trip.save!
    @booking.set_values(params[:user][:offer_id],params[:user][:checkin],params[:user][:checkout],params[:user][:guests],guest.id, @trip.id)
    @booking.aid = params[:user][:aid] if params[:user][:aid]
    @booking.save!
    @guest = User.find(@trip.guest_id)
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

