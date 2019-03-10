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
      flash[:error] = user.errors.full_messages
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
    binding.pry
    @user = User.find(params[:id])
    if !logged_in?
      redirect "/login"
      flash[:error] = ["Not logged in"]
    elsif !(session[:user] == @user)
      redirect "/profile"
      flash[:error] = ["Incorrect User"]
    end
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:id" do
      # binding.pry
    @user = User.find(params[:id])
    if !logged_in?
      flash[:error] = ["Not logged in"]
      redirect "/login"
    elsif !session[:user] == @user
      flash[:error] = ["Incorrect User"]
      redirect "/profile"
    elsif !@user.authenticate(params[:password])
      flash[:error] = ["Incorrect Password"]
      redirect "/users/#{@user.id}/edit"
    elsif params[:submit] == "DELETE"
      @user.delete
      redirect "/games"
    else
      updates = filter_blanks(params, [:username, :email], @user)
      # binding.pry
      @user.update(username: updates[:username], email: updates[:email])
      @user.update(password: params[:new_password]) if params[:new_password] != ""
      if @user.valid?
        @user.save
        session[:user] = @user
        redirect "/profile"
      else
        flash[:error] = @user.errors.full_messages
        redirect "/users/#{@user.id}/edit"
      end
    end

  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end

  helpers do
    def filter_blanks(updates, param_names, model)
      updates.each do |k, v|
        if param_names.include?(k) || param_names.include?(k.to_sym)
          if updates[k] == ""
            updates[k] = model.send(k)
          end
        end
      end
      return updates
    end
  end
end
