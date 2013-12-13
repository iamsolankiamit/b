class UserMailer < ActionMailer::Base
  default from: "notifications@roomnhouse.com"
  def trip_registered(user)
    mail(:to => user.email, :subject => "Booking complete")
  end
end
