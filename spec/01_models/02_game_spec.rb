require_relative '../spec_helper'

before do
  User.delete_all
  Game.delete_all
  @user = User.create(username: 'fiat', password: 'secret_pass')
  @games = []
  @games << Game.create(name: 'polymono', user_id: @user.id)
  @games << Game.create(name: 'space danger', user_id: @user.id)
end
