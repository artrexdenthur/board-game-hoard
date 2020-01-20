source 'http://rubygems.org'

ruby '2.6.0'

gem 'sinatra'
gem 'activerecord', '~> 4.2', '>= 4.2.6', :require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'dotenv'
gem 'foreman'
gem 'rails_12factor'
gem 'rake'
gem 'require_all'
gem 'pg', '~> 0.18'
gem 'thin'
gem 'sinatra-flash', :require => 'sinatra/flash'
gem 'bcrypt'
gem 'bgg-api'

group :development do
  gem 'pry'
  gem 'shotgun'
  gem 'sqlite3', '~> 1.3.6'
  gem "tux"
end

group :test do
  gem 'rspec'
  gem 'capybara'
  gem 'faker'
  gem 'rack-test'
  gem 'database_cleaner', git: 'https://github.com/bmabey/database_cleaner.git'
end
