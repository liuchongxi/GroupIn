class AdRequest < ActiveRecord::Base
	scope :sorted, lambda { order("position ASC") }
	validates :first_name, presence: true, length: {maximum: 25 } # first_name has maximum length of 50 characters.
 	validates :last_name, presence: true, length: {maximum: 50 } # last_name has maximum length of 50 characters.
  validates :email, uniqueness: {case_sensitive: false}
  validates_format_of :email, :message => "Please use your email address with @xxx.xxx :)", with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create

end
