ENV['RACK_ENV'] ||= "development"
ENV['SINATRA_ENV'] ||= ENV['RACK_ENV']

require 'dotenv'
Dotenv.load

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

set :database_file, "./database.yml"

require './app/controllers/application_controller'
require_all 'app'
