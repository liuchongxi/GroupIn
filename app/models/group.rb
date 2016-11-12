class Group < ActiveRecord::Base
  belongs_to :user
  validate :event_time_should_be_later_than_now
  def event_time_should_be_later_than_now
    if time<Time.now
      errors.add(:time, "time is invalid(should be later than present time)")
    end
  end

end
