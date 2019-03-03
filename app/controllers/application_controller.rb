require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    # set :session_secret  # TODO add a secure session secret
  end

  get "/" do

    erb :welcome#, :layout => false
  end

  get "/login" do
    erb :login # TODO write login page
  end

  post "/login" do
    unless params[:username] == "" || params[:password] == ""
      user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect '/account'
        end
    end

    redirect '/failure'
  end

end
