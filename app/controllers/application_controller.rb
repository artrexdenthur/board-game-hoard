require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV.fetch('SESSION_SECRET') { SecureRandom.hex(20) }
    register Sinatra::Flash
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
      else
        flash[:error] = ["Incorrect username or password"]
        redirect "/login"
      end
    end
  end

  get "/logout" do
    session.clear
    erb :"/logout.html"
  end

  get "/profile" do
    redirect "/login" unless session[:user]
    @user = session[:user]
    erb :"/profile.html"
  end
  helpers do

    def logged_in?
      !!session[:user]
    end

    def nav_list
      nav_list ||= [
        { name: "Games", path: "/games", login: "u" },
        { name: "Users", path: "/users", login: "u" },
        { name: "Sign Up", path: "/users/new", login: "f" },
        { name: "Login", path: "/login", login: "f" },
        { name: "Profile", path: "/profile", login: "t" },
        { name: "Logout", path: "/logout", login: "t" }
      ]
    end

    def trinary_login_match?(arg)
      case arg
      when "t"
        return !!logged_in?
      when "f"
        return !logged_in?
      when "u"
        return true
      end
    end
  end
end
