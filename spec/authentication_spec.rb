require_relative 'spec_helper'

describe "Registration" do
  it "Allows a user to create a user account with an email and password" do
    visit "/users/new"
    fill_in "email", with: "test@test.net"
    fill_in "password", with: "testpass"
    click_on "submit"
    expect(page).to have_content "test@test.com"
  end
end


describe "Authentication" do
  it "Allows a user with an existing account to log in with email/username and password" do
  end
end
