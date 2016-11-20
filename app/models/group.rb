class Group < ActiveRecord::Base
  belongs_to :user
  validates :name, uniqueness: {case_sensitive: false}, presence: true, length: {maximum: 50 }
  validates :time, presence: true
  validates :activity_type, presence: true
  validates :location, presence: true, length: {maximum: 50 }
  validates :group_owner, presence: true
  validates :description, presence: true, length: {maximum: 1000 }
  # validate :event_time_should_be_later_than_now
  # def event_time_should_be_later_than_now
  #   if time<Time.now
  #     errors.add(:time, "time is invalid(should be later than present time)")
  #   end
  # end

end
