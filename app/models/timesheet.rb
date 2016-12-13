class Timesheet < ApplicationRecord
  before_save :defaut_value

  def defaut_value
    self.date ||= DateTime.now
    self.status ||= 'pending'
  end
end
