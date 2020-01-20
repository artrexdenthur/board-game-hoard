class Game < ActiveRecord::Base
  has_many :user_games
  has_many :users, through: :user_games
  validates_presence_of :name
end

def average_rating
  
end