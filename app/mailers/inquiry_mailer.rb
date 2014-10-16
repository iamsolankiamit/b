class InquiryMailer < ActionMailer::Base
  default from: "notifications@roomnhouse.com"
  def new_inquiry(inquiry,host_id)
    @inquiry = inquiry
    @host = User.find(host_id)
    @offer = Offer.find(inquiry.offer_id)
    mail(:to => user.email, :subject => "Booking complete")
  end
end
