class AddRatingPlaysAndPlayerCountToGames < ActiveRecord::Migration
  def change
    add_column :games, :rating, :integer
    add_column :games, :plays, :integer
    add_column :games, :player_count, :string
  end
end
