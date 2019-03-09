class User < ActiveRecord::Base
  validates_presence_of :username, :email, :password_digest
  validates :username, :email, uniqueness: { case_sensitive: false }

  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  validate :validate_username # See below. Usernames cannot be the same as existing emails

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :email, confirmation: true

  has_secure_password
  has_many :games

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

end
