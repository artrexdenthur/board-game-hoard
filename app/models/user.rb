class User < ActiveRecord::Base
  validates_presence_of :username, :email, :password_digest
  has_secure_password
  has_many :game
end
