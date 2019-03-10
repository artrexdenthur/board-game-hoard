class GamesController < ApplicationController

  # GET: /games
  get "/games" do
    # binding.pry
    @index_titles = {
      'name' => 'Name',
      'user_id' => 'User',
      'rating' => 'User Rating',
      'plays' => 'Times Played',
      'player_count' => 'Player Count'
    }
    @index_commands = {
      'user_id' => [:user, :username]
    }
    @att_links = {
      'user_id' => :user_link,
      'name' => :game_link
    }
    @games = Game.all
    # binding.pry
    erb :"/games/index.html"
  end

  # GET: /games/new
  get "/games/new" do
    if session[:user]
      erb :"/games/new.html"
    else
      redirect "/login"
    end
  end

  # POST: /games
  post "/games" do

    if session[:user]
      game = Game.new(
        name: params[:name],
        rating: params[:rating],
        plays: params[:plays],
        player_count: params[:player_count],
        user_id: session[:user].id)
      redirect "/games/new" unless game.save
    else
      redirect "/login"
    end
    redirect "/profile"
  end

  # GET: /games/5
  get "/games/:id" do
    # binding.pry
    @game = Game.find(params[:id])
    erb :"/games/show.html"
  end

  # GET: /games/5/edit
  get "/games/:id/edit" do
    @game = Game.find(params[:id])
    # validate
    if !logged_in?
      redirect "/login"
    elsif !current_user_owns?(@game)
      redirect "/games/#{params[:id]}"
    end
    erb :"/games/edit.html"
  end

  # PATCH: (includes delete functionality) /games/5
  patch "/games/:id" do
    # binding.pry
    @game = Game.find(params[:id])
    if !logged_in?
      redirect "/login"
    elsif !current_user_owns?(@game)
      redirect "/games/#{@game.id}"
    elsif params[:submit] == "DELETE"
      @game.delete
      redirect "/profile"
    else
      @game.update(
        name: params[:name],
        rating: params[:rating],
        plays: params[:plays],
        player_count: params[:player_count])
      if @game.valid?
        redirect "/profile"
      else
        flash[:error] = @game.errors.full_messages
        redirect "/games/#{@game.id}/edit"
      end
    end
  end

  # DELETE: /games/5/delete
  delete "/games/:id/delete" do
    @game = Game.find(params[:id])

    erb :"/games/delete.html"
  end


  helpers do
    def user_link(user_id)
      "/users/#{user_id}"
    end

    def game_link(game_name)
      game_id = Game.find_by(name: game_name).id
      "/games/#{game_id}"
    end


    def current_user_owns?(game)
      !!session[:user].games.include?(game)
    end

    def show_hash
      {
         titles: {
          'name' => 'Name',
          'user_id' => 'User',
          'rating' => 'Personal Rating',
          'plays' => 'Times Played',
          'player_count' => 'Player Count'
        },
        commands: {
          'user_id' => [:user, :username]
        },
        links: {
          'user_id' => :user_link
        }
      }
    end

    def user_hash
      {
        titles: {
          'name' => 'Name',
          'rating' => 'Personal Rating',
          'plays' => 'Times Played',
          'player_count' => 'Player Count'
        },
        commands: {}
      }
    end
  end
end
