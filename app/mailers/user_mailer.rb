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
end
