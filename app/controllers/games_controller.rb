class GamesController < ApplicationController

  # GET: /games
  get "/games" do
    @index_titles = {
      'name' => 'Name',
      'user_id' => 'User'
    }
    @index_commands = {
      'user_id' => [:user, :username]
    }
    @att_links = {
      'user_id' => :user_link
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
    # binding.pry
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
    def user_link(user_id)
      "/users/#{user_id}"
    end

    def show_hash
      {
         titles: {
          'name' => 'Name',
          'user_id' => 'User'
        },
        commands: {
          'user_id' => [:user, :username]
        },
        links: {
          'user_id' => :user_link
        }
      }
    end
  end
end
