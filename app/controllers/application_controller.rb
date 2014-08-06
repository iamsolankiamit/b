require_dependency 'crawler_detection'
class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_or_guest_user
  before_filter :store_location

  layout :set_layout

  def set_layout
    CrawlerDetection.crawler?(request.user_agent) ? 'crawler' : 'application'
  end

  # store the location to redirect user to edit page of offers.
  def store_location
    session[:passthru] = params[:passthru] if params[:passthru]
  end

  def redirect_back_or_default(default)
    session[:passthru] || root_path
  end

  def after_sign_in_path_for(resource_or_scope)
    current_or_guest_user
    redirect_back_or_default(resource_or_scope)
  end

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
    if guest_user_account.offers.exists?
      guest_offers = guest_user_account.offers.all
      guest_offers.each do |offer|
        offer.user_id = current_user.id
        offer.email = current_user.email
        offer.save!
      end
    end
  end

  private
  def create_guest_user
    uuid = rand(36**64).to_s(36)
    temp_email = "guest_#{uuid}@guest.com"
    u = User.create(:email => temp_email, :lazy_id => uuid, guest_account: true)
    u.skip_confirmation!
    u.save(:validate => false)
    cookies[:uuid] = { :value => uuid, :path => '/', :expires => 5.years.from_now }
    u
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_path, :alert => exception.message
  end
end
