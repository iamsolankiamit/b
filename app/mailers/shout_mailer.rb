class ShoutMailer < ActionMailer::Base
	default from: "notifications@roomnhouse.com"

	def host_request(email, shout)
		# @place = Offer.near(params[:destination])
		# @price = @place.find(offer.nightly_rate_amount)
		# @host = Offer.find(params[:user_id])
		
		mail(:to => email , :subject=> "Request by the Guest!!")

	end

end