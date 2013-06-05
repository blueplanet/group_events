source 'https://rubygems.org'

gem 'rails', '4.0.0.rc1'

gem 'slim-rails'
gem 'omniauth-twitter'

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'capybara'
end

group :development do
  gem 'guard-livereload'
  gem 'guard-rspec'
  gem 'growl'
  gem 'pry-rails'
  gem 'launchy'
end

group :test do
  gem 'coveralls', require: false
end

group :production do
  gem 'pg'
  gem 'thin'
end

gem 'sass-rails', '~> 4.0.0.rc1'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.0.1'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

ruby "2.0.0"
