source 'https://rubygems.org'

ruby '1.9.3'
gem 'rails', '3.2.12'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3', :group => :development
gem "pg", :group => :production
gem 'wicked'
gem "devise"
gem 'cancan'
gem 'aws-s3'
gem 'fog', :git => 'git://github.com/fog/fog.git'
gem 'newrelic_rpm'
gem "sentry-raven", :git => "https://github.com/getsentry/raven-ruby.git"
gem "paperclip"
gem "aws-sdk"

gem 'kaminari' #pagination
gem "rails_admin" , :git => "https://github.com/sferik/rails_admin.git"
gem "thin", :group => :development
gem 'simple_form'
gem 'twitter-bootstrap-rails', :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git'
gem 'nifty-generators'

gem "jquery-fileupload-rails"
# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem "haml"
  gem "sass"
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  #gem 'therubyracer', :platforms => :ruby
  
  #gem 'asset_sync'
  gem 'therubyracer', :platforms => :ruby
  
  gem 'asset_sync'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
#gem 'unicorn'
gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
gem 'debugger'
group :test do
  gem "rspec-rails", :group => :development
  gem "mocha"
end
