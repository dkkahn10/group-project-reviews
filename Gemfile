# frozen_string_literal: true
source 'https://rubygems.org/'
ruby '2.3.1'

gem 'rails', '5'
gem 'pg', '~> 0.15'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'listen'
gem 'foundation-rails'
gem 'devise'
gem 'rubocop'
gem 'carrierwave', '>= 1.0.0.beta', '< 2.0'
gem 'fog'
gem 'mini_magick'
gem 'dotenv-rails'
gem 'sendgrid-ruby'

group :development, :test do
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'rspec-rails', '~> 3.0'
  gem 'pry-rails'
  gem 'shoulda'
  gem 'valid_attribute'
end

group :test do
  gem 'launchy', require: false
  gem 'coveralls', require: false
  gem 'database_cleaner'
  gem 'email_spec'
end

group :production do
  gem 'rails_12factor'
end
