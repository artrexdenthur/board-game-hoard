require 'faker'
User.destroy_all
Game.destroy_all

names = [
  "Agricola",
  "Twilight Imperium",
  "Caverna",
  "Codenames",
  "Betrayal at House on the Hill",
  "Parchisi",
  "Love Letter",
  "Bang",
  "Race for the Galaxy",
  "Decrypto",
  "Fortress America"
]

9.times do |i|
  user = User.create(username: Faker::Internet.username,
    email: Faker::Internet.safe_email,
    password: "pass123"
  )
  names.each do |n|
    Game.create(name: n, user_id: user.id, rating: (rand*10).round + 1, plays: (rand*100).round + 1)
  end
end
