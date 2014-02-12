source 'https://rubygems.org'
gem 'rails', '4.0.0'
gem 'mysql2'
gem 'execjs'
gem 'therubyracer'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'fb-channel-file'
gem 'rack-facebook-signed-request', :git => 'git://github.com/cmer/rack-facebook-signed-request.git'
gem 'koala', '>= 1.7.0rc1'
gem 'simple_form'
gem 'useragent', '>= 0.2.1'
gem 'p3p'
gem 'omniauth'
gem 'omniauth-facebook', '~> 1.4.1'
gem 'devise', '~> 3.1.0'
gem 'rack-iframe'
gem 'kaminari'
gem 'rack-cors', :require => 'rack/cors'
group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development do
  gem 'sqlite3'
  gem 'mysql2'
  gem 'pry'
  gem 'capistrano', '~> 2.15.4'
end

group :production do
  # gem 'rb-readline', '~> 0.5.0'
  gem 'mysql2'
  gem 'unicorn'
end

group :test do
  gem 'capybara'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem "database_cleaner"
  gem "email_spec"
end

group :test, :development do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end
