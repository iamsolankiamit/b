class ApplicationController < ActionController::Base
  protect_from_forgery
  
helper_method :current_or_guest_user
  # if user is logged in, return current_user, else return guest_user
  def current_or_guest_user
    if current_user
      if cookies[:uuid]
        logging_in # Look at this method to see how handing over works
        guest_user.destroy # Stuff have been handed over. Guest isn't needed anymore.
        cookies.delete :uuid # The cookie is also irrelevant now
      end
      current_user
    else
      guest_user
    end
  end

  # find guest_user object associated with the current session,
  # creating one as needed
  def guest_user
      User.find_by_lazy_id(cookies[:uuid].nil? ? create_guest_user.lazy_id : cookies[:uuid])
  end

  # called (once) when the user logs in, insert any code your application needs
  # to hand off from guest_user to current_user.
  def logging_in
      # What should be done here is take all that belongs to user with lazy_id matching current_user's uuid cookie... then associate them with current_user
    guest_user_account = User.find_by_lazy_id(cookies[:uuid])
    guest_offers = guest_user_account.offers.all
    guest_offers.each do |offer|
      offer.user_id = current_user.id
      offer.save!
    end
  end

  private

    def create_guest_user
        uuid = rand(36**64).to_s(36)
        temp_email = "guest_#{uuid}@email_address.com"
        u = User.create(:email => temp_email, :lazy_id => uuid)
        u.save(:validate => false)
        cookies[:uuid] = { :value => uuid, :path => '/', :expires => 5.years.from_now }
        u
    end

rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_path, :alert => exception.message
  end
end
