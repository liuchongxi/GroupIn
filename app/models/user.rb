class User < ActiveRecord::Base
  has_many :groups
  validates :first_name, presence: true, length: {maximum: 50 } # first_name has maximum length of 50 characters.
  validates :last_name, presence: true, length: {maximum: 50 } # last_name has maximum length of 50 characters.
  validates :email, uniqueness: {case_sensitive: false}
  validates_format_of :email, :message => ":Please use your sfu eamil address :)", :with => /\A([^@\s]+)@((?:[-s-s][-f-f][-u-u]\.[-c-c][-a-a]))\Z/i
  has_secure_password #ensure that an attacker won’t be able to log in to the site even if they obtain a copy of the database
  validates :password, :length => { :minimum => 5, :maximum => 10 }, :presence=>true, :confirmation =>true
  #validates :password_confirmation, :presence=>true
  #validate :password_not_match
  #def password_not_match
  # if(password != password_confirmation)
  #   errors.add(:password, "password does not match password_confirmation")
   # => end
  #end
  #vaildates :if @uesr.password==@user.password_confirmation
end
