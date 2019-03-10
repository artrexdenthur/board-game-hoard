class Game < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :name, :user_id
  validates :rating, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 10
   }
   validates :plays, numericality: { only_integer: true }
end
