class User < ActiveRecord::Base
  has_many :groups
  validates :password, :length => { :minimum => 5, :maximum => 10 }, :confirmation =>true
  validates_confirmation_of :password
  validates_format_of :email, :with=>
end
