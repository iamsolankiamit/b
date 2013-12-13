class UserMailer < ActionMailer::Base
  default from: "notifications@roomnhouse.com"
  def trip_registered(user,trip,booking)
    mail(:to => user.email, :subject => "Booking complete")
    @host = User.find(trip.host_id)
    @offer = Offer.find(trip.offer_id)
  end
end
