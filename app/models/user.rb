class User < ActiveRecord::Base
  attr_accessor :remember_token
  has_secure_password
  has_many :groups

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  #Remembers user even after closing website
  def remember_user
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(remember_token)
    if remember_digest.nil?
      return false
    else
      BCrypt::Password.new(remember_digest).ispassword?(remember_token)
    end
  end

  #Forgets remembered user
  def forget_user
    update_attribute(:remember_digest, nil)
  end
end
