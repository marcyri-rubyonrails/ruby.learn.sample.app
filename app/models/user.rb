class User < ApplicationRecord
  # attr_accessor :password, :password_confirmation
  attr_accessor :remember_token # create virtual attribute, it doesn't exists in db
  before_save { self.email = email.downcase } # not completely -- idiomatically correct
  has_secure_password
  validates(:name, { presence: true, length: { maximum: 50 } })
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, 
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  
  validates :password, presence: true, length: { minimum: 6 }  

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember 
    self.remember_token = User.new_token # self.remember_token - self - create local variable 
    update_attribute(:remember_digest, User.digest(remember_token)) # also self.update_attribute
  end

  # Forgets a user in the database for use in persistent sessions.
  def forget
    update_attribute(:remember_digest, nil)
  end

  # Returns true if the given token matches the digest
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
end
