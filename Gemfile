source 'https://rubygems.org'

ruby '2.1.2'

gem 'rails', '4.0.0'

gem 'slim-rails'
gem 'omniauth-twitter'

gem 'foreman'
gem 'bootstrap-sass'

gem 'redcarpet'
gem 'bootstrap-datepicker-rails'

gem 'font-awesome-rails'

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
  gem 'parallel_tests'
end

group :test do
  gem 'coveralls', require: false
end

group :production do
  gem 'pg'
  gem 'thin'
end

gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 1.0.1'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end
