class MessageBoard < ActiveRecord::Base
  belongs_to :user
  validates :sender, presence: true
  validates :user_id, presence: true
  validates :group_name, presence: true
  validates :message, presence: true, length: {maximum: 200 }
end
