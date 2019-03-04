class User < ActiveRecord::Base
  validates_presence_of :username, :email, :password_digest
  validates :username, :email, uniqueness: { case_sensitive: false }
  has_secure_password
  has_many :games
end
