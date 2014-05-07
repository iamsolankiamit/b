class UserMailer < ActionMailer::Base
  default from: "notifications@roomnhouse.com"
  def trip_registered(user,trip,booking)
     @user = user
    @host = User.find(trip.host_id)
    @trip = trip
    @booking = booking
    @offer = Offer.find(trip.offer_id)
   mail(:to => user.email, :subject => "Booking complete")
  end

  def guest_booking_done(guest, trip,booking)
    @guest = guest
    @booking = booking
    @offer = Offer.find(trip.offer_id)
    mail(:to => @guest.email, :subject => "Roomnhouse: Booking request has been made")
  end

  def host_acceptance(guest,host, trip, booking)
    @guest = guest
    @host = host
    @trip = trip
    @booking = booking
    @offer =Offer.find(trip.offer_id)
    mail(:to => @host.email, :subject => "Roomnhouse: Booking request")
  end

  def guest_notifier(trip_id)
    @trip = Trip.find(trip_id)
    @guest = User.find(@trip.guest_id)
    @booking = Booking.where(:trip_id => trip_id).first
    @host = User.find(@trip.host_id)
    @offer = Offer.find(@trip.offer_id)
   mail(:to => guest.email, :subject => "Booking complete")
  end

  def receipt

  end

  def feedback

  end
end
