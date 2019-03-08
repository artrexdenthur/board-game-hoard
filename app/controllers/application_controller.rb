require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV.fetch('SESSION_SECRET') { SecureRandom.hex(20) }
    # binding.pry
  end

  get "/" do

    erb :welcome#, :layout => false
  end

  get "/login" do
    erb :"/login.html" # TODO write login page
  end

  post "/login" do
    # binding.pry
    unless params[:username] == "" || params[:password] == ""
      user = User.find_by(username: params[:username])
      # binding.pry
      if user && user.authenticate(params[:password])
        session[:user] = user
        redirect "/profile"
      end
    end
    redirect '/failure'
  end

  get "/logout" do
    session.clear
    "You have been logged out"
  end

  get "/profile" do
    redirect "/login" unless session[:user]
    @user = session[:user]
    erb :"/profile.html"
  end
end
