class GamesController < ApplicationController

  # GET: /games
  get "/games" do
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
    erb :"/games/show.html"
  end

  # GET: /games/5/edit
  get "/games/:id/edit" do
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
end
