require_relative '../spec_helper'

describe "User model" do
  it "Requires a username, email and password" do
    bad_users = [
      {username: "noemail", password: "noemailpass"},
      {email: "nousername@test.net", password: "nousername"},
      {username: "nopass", email: "nopass@nopass.net"}
    ]
    bad_users.each do |bu|
      user = User.new(bu)
      expect(user.save).to eq(false)
    end
    good_user = User.new({username: "new_user", email: "new@user.com", password: "goodpass"})
    expect(good_user.save).to eq(true)
  end

  it "Has a secure password" do
    User.create({username: "new_user", email: "new@user.com", password: "goodpass"})
    user = User.find_by_username("new_user")
    expect(user.password).to be(nil)
    expect(user.authenticate("wrongpass")).to be(false)
    expect(!!user.authenticate("goodpass")).to be(true)
  end

end
