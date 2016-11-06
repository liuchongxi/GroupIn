class User < ActiveRecord::Base
  attr_accessor :remember_token
  has_secure_password #ensure that an attacker won’t be able to log in to the site even if they obtain a copy of the database
  has_many :groups
  validates :first_name, presence: true, length: {maximum: 50 } # first_name has maximum length of 50 characters.
  validates :last_name, presence: true, length: {maximum: 50 } # last_name has maximum length of 50 characters.
  validates :email, uniqueness: {case_sensitive: false}, presence: true
  validates_format_of :email, :message => ":Please use your sfu eamil address :)", :with => /\A([^@\s]+)@((?:[-s-s][-f-f][-u-u]\.[-c-c][-a-a]))\Z/i
  validates :password, :length => { :minimum => 5, :maximum => 10 }, :presence=>true, :confirmation =>true
  validates :password_confirmation, :presence=>true

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

  #validate :password_not_match
  #def password_not_match
  # if(password != password_confirmation)
  #   errors.add(:password, "password does not match password_confirmation")
   # => end
  #end
  #vaildates :if @uesr.password==@user.password_confirmation
end
