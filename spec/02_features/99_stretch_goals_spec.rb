require_relative '../spec_helper'

describe "Stretch Integration:" do
  before do
    User.create(username: "Vlaada", email: "chvatil@cge.com", password: "Vlaadapass")
    Game.create(name: "Galaxy Trucker", user_id: 1)
    User.create(username: "Reiner", email: "knizia@games.net", password: "Reinerpass")
    Game.create(name: "Flea Circus", user_id: 2)
    visit "/login"
    fill_in "username", with: "Vlaada"
    fill_in "password", with: "Vlaadapass"
    click_on "submit"
  end
  let(:user) {User.first}
  let(:game) {Game.first}

  it "Profile page shows all of a user's games" do
    Game.create(name: "Tash-Kalar", user_id: 1)
    visit "/profile"
    expect(page).to have_content "Galaxy Trucker"
    expect(page).to have_content "Tash-Kalar"
  end

  it "Users can change their details" do
    visit "/profile"
    click_on "edit"
    fill_in "username", with: "Vlaadarian"
    fill_in "email", with: "chvatil@gmail.net"
    fill_in "password", with: "newpass"

  end
