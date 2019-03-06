require_relative '../spec_helper'

describe "Users" do

  it "Allows a user to create a user account with an email and password" do
    visit "/users/new"
    fill_in "username", with: "new_user"
    fill_in "email", with: "test@test.net"
    fill_in "password", with: "testpass"
    click_on "submit"
    expect(page.status_code).to eq(200)
    expect(page).to have_content "new_user"
    expect(page).to have_content "test@test.net"
  end


  it "Allows a user with an existing account to log in with email and password" do
    visit "/users/login"
    fill_in "username", with: "new_user"
    fill_in "password", with: "testpass"
    click_on "submit"
    expect(page).to have_content "new_user"
    expect(page).to have_content "test@test.net"
  end

  it "Allows a user with an existing account to log in with username and password" do
    vist "/users/login"
    fill_in "username", with: "new_user"
    fill_in "password", with: "testpass"
    click_on "submit"
  end
end

describe "Games" do
  it "Can view all games and their users on the index page:" do
    vist "/users/login"
    fill_in "username", with: "new_user"
    fill_in "password", with: "testpass"
    click_on "submit"
  end

  it "Can view a single game instance with all its details:" do
    visit "/games/1"
    expect(page_content).to include("Game Title")
  end
end
