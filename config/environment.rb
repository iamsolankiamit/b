# Load the rails application
require File.expand_path('../application', __FILE__)

ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => ENV['SENDGRID_USERNAME'],
  :password       => ENV['SENDGRID_PASSWORD'],
  :domain         => 'heroku.com',
  :enable_starttls_auto => true
}


# Initialize the rails application
Bnbhub::Application.initialize!

# Initialize ActiveMerchant config
require 'active_merchant/billing/integrations/action_view_helper'
ActionView::Base.send(:include, ActiveMerchant::Billing::Integrations::ActionViewHelper)
