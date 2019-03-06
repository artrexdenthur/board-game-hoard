class GamesController < ApplicationController

  # GET: /games
  get "/games" do
    @index_attribute_titles = {
      'name' => 'Name',
      'user_id' => 'User'
    }
    @index_attribute_commands = {
      'user_id' => [:user, :username]
    }
    @attribute_link_format = {
      'user_id' => "/users/"
    }
    @games = Game.all
    # binding.pry
    erb :"/games/index.html"
  end

  # GET: /games/new
  get "/games/new" do
    erb :"/games/new.html"
  end

  # POST: /games
  post "/games" do
    redirect "/games"
  end

  # GET: /games/5
  get "/games/:id" do
    @game = Game.find(params[:id])
    erb :"/games/show.html"
  end

  # GET: /games/5/edit
  get "/games/:id/edit" do
    # REQUIRES VALIDATION
    erb :"/games/edit.html"
  end

  # PATCH: /games/5
  patch "/games/:id" do
    redirect "/games/:id"
  end

  # DELETE: /games/5/delete
  delete "/games/:id/delete" do
    redirect "/games"
  end


  helpers do
  end
end
