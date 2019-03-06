User.delete_all
Game.delete_all

User.create(username: "VivJ", email:"test@test.com", password: "VivJpass")
User.create(username: "TomV", email: "tom@vaseline.com", password: "TomVpass")
Game.create(name: "Concordia", user_id: 1)
Game.create(name: "Space Base", user_id: 1)
Game.create(name: "Cards Against Humanity", user_id: 1)
Game.create(name: "King of Tokyo", user_id: 2)
Game.create(name: "Concordia", user_id: 2)
Game.create(name: "BattleCON", user_id: 2)
