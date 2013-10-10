source 'https://rubygems.org'

ruby '1.9.3'
gem 'rails', '3.2.12'

gem 'safe_yaml'
gem "pg"
gem 'wicked'
gem "devise"
gem 'cancan'
gem 'aws-s3'
gem 'fog'
group :production do
  gem 'newrelic_rpm'
  gem "sentry-raven", :git => "https://github.com/getsentry/raven-ruby.git"
end
gem "paperclip"
gem "aws-sdk"
gem "s3_direct_upload"
gem 'delayed_job_active_record'
gem 'daemons'
gem 'pg_random_id', '1.0.0'
gem 'heroku-deflater', :group => :production
gem 'kaminari'
gem "thin", :group => :development
gem 'simple_form'
gem "letter_opener", :group => :development
group :assets do
  gem 'jquery-rails', '>=2.1'
  gem 'jquery-ui-rails', '~> 3.0'
  gem 'coffee-rails', '~> 3.2.1'
  gem "haml"
  gem "yui-compressor"
  gem 'sass-rails', '~> 3.2.3'
  gem 'bootstrap-sass', :git => 'git://github.com/thomas-mcdonald/bootstrap-sass.git', :branch => '3'
  gem 'asset_sync'
  gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'
end
gem 'geocoder'
gem 'gmaps4rails'
gem 'font-awesome-rails', '~> 3.0'
# gem 'twitter-bootstrap-rails', :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git'
gem "jquery-fileupload-rails"
# Gems used only for assets and not required
# in production environments by default.
gem 'unicorn'
# payment gateway gems
gem "activemerchant", path: "lib/active_merchant"
group :test do
  gem "rspec-rails", :group => :development
end
