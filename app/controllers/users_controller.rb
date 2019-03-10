class UsersController < ApplicationController

  # GET: /users
  get "/users" do
    # binding.pry
    erb :"/users/index.html"
  end

  # GET: /users/new
  get "/users/new" do

    erb :"/users/new.html"
  end

  # POST: /users
  post "/users" do
    # binding.pry
    user = User.new(email: params["email"], password: params["password"], username: params["username"])
    # binding.pry
    if user.save
      session[:user] = user
      redirect "/profile"
    else
      flash[:error] = user.errors.messages
      user.delete
      redirect "/users/new"
    end
  end


  # GET: /users/5
  get "/users/:id" do
    @user = User.find(params[:id])
    erb :"/users/show.html"
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    @user = User.find(params[:id])
    if !logged_in?
      redirect "/login"
    elsif !(session[:user] == @user)
      redirect "/users/#{params[:id]}"
    end
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    @user = User.find(params[:id])
    if !logged_in?
      redirect "/login"
    elsif !session[:user] == @user
      redirect "/users/#{params[:id]}"
    elsif params[:submit] == "DELETE"
      @user.delete
      redirect "/games"
    else
      @user.update(username: params[:username], email: params[:email], password: params[:password])
    end
    redirect "/users/#{@user.id}"

  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end
end
