class User < ActiveRecord::Base
  validates_presence_of :username, :email, :password_digest
  validates :username, :email, uniqueness: { case_sensitive: false }
  has_secure_password
  has_many :games

  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  validate :validate_username


  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end
end
