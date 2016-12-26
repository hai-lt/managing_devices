class Timesheet < ApplicationRecord
  before_save :defaut_value
  validate :can_not_set_time_in_the_past
  def defaut_value
    self.date ||= DateTime.now
    self.status ||= 'pending'
  end

  def can_not_set_time_in_the_past
    errors.add(:date, "can not set time in the past") if self.date.utc < DateTime.now.utc
  end
end
