class ShoutsController < ApplicationController
	respond_to :js
	def create
		@shout = Shout.new(params[:shouts])
		if(@shout.save!)
			respond_to do |format|
				format.js { render(:partial => 'create.js') }
			end
		end				

		ShoutsController.delay.find_email   
		ShoutsController.delay.find_phone 

	end	
#----------------------------------------
def show
	@shout = Shout.find(params[:id])
	@offers = current_user.offers.all
end
	def available
		@shouts = Shout.all
	end
#----------------------------------------
	def self.find_email
		find
		@emails = places.select("users.email").uniq
		@emails.each do |email|
			ShoutMailer.delay.host_request(@email,@shout)
		end
	end

	def self.find_phone
		find
		phone = places.select("users.phone").uniq
		phone.each do |phone|
			unless (phone == "")
				user_sms = ShoutSmsSender.new(phone,@shout) #new is used to create the instance
				#ShoutSmsSender is the class in the lib(a different file in lib).
			end
		end
	end

	def find
		rate = params[:shouts][:per_night].to_i
		min = rate/2 
		max = rate*2
		places = Offer.near(params[:shouts][:destination],50).where(nightly_rate_amount:[min,max])
		places = places.joins(:user)
		ActiveRecord::Associations::Preloader.new(places, :user).run
	end

end
