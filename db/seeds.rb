require 'faker'
User.destroy_all
Game.destroy_all

10.times do |i|
  user = User.create(username: Faker::Internet.username,
    email: Faker::Internet.safe_email,
    password: "pass123"
  )
  Game.create(name: Faker::Space.moon, user_id: user.id)
  Game.create(name: Faker::Verb.base, user_id: user.id)
end
