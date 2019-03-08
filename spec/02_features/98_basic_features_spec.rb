require_relative '../spec_helper'

describe "Users:" do

  it "Allows a user to create a user account with an email and password" do
    visit "/users/new"
    fill_in "username", with: "new_user"
    fill_in "email", with: "test@test.net"
    fill_in "password", with: "testpass"
    click_on "submit"
    expect(page.status_code).to eq(200)
    expect(page).to have_content "new_user"
    expect(page).to have_content "test@test.net"
    # binding.pry
  end


  it "Allows a user with an existing account to log in with email and password" do
    User.create(username: "new_user", password: "testpass", email: "test@test.net")
    visit "/login"
    # binding.pry
    fill_in "username", with: "new_user"
    fill_in "password", with: "testpass"
    click_on "submit"
    expect(page).to have_content "new_user"
    expect(page).to have_content "test@test.net"
  end

  # TODO: Cannot create a user with a username or password that already identifies a user

end

describe "Games CRUD:" do
  before do
    User.delete_all
    Game.delete_all
    User.create(username: "Vlaada", email: "chvatil@cge.com", password: "Vlaadapass")
    Game.create(name: "Galaxy Trucker", user_id: 1)
    Game.create(name: "Pictomania", user_id: 1)
    User.create(username: "Reiner", email: "knizia@hotmail.com", password: "Reinerpass")
    Game.create(name: "Ra", user_id: 2)
    Game.create(name: "Flea Circus", user_id: 2)
  end
  # Read

  it "Can view all games and their users on the index page:" do
    visit "/games"
    expect(page).to have_content "Galaxy Trucker"
    expect(page).to have_content "Flea Circus"
    expect(page).to have_content "Vlaada"
    expect(page).to have_content "Reiner"
  end

  it "Can view a single game instance with all its details:" do
    visit "/games/1"
    expect(page).to have_content("Galaxy Trucker")
  end

  # Create

  it "Must be logged in to create a new game" do
    visit "/logout"
    visit "/games/new"
    expect(page).to have_content("User Login")
  end

  it "Can create a Game instance, then view it alone and in the full list" do

    User.create(username: "new_user", password: "testpass", email: "test@test.net")
    visit "/login"
    # binding.pry
    fill_in "username", with: "new_user"
    fill_in "password", with: "testpass"
    click_on "submit"

    visit "/games/new"
    fill_in "name", with: "Go"
    click_on "submit"
    expect(page).to have_content("Go")
  end

  # TODO: It cannot create an unsanitary game
end
