class UsersController < ApplicationController

  # GET: /users
  get "/users" do
    erb :"/users/index.html"
  end

  # GET: /users/new
  get "/users/new" do
    erb :"/users/new.html"
  end

  # POST: /users
  post "/users" do
    # binding.pry
    user = User.new(email: params["email"], password_digest: params["password"], username: params["username"])
    # binding.pry
    if user.save
      redirect "/users"
    else
      redirect "/users/new"
    end
  end

  get "/users/login" do
    erb :"/users/login.html"
  end

  post "/users/login" do
    user = User.find_by(username: params[:username]) || User.find_by(email: params[:username])
    if user && user.authenticate(params[:password])
      session[:user] = user
      redirect "/users/#{user.id}"
    end
    redirect "/users/login"
  end

  # GET: /users/5
  get "/users/:id" do
    erb :"/users/show.html"
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end
end
