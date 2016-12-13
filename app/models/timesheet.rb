class Timesheet < ApplicationRecord
  before_save :defaut_value

  def defaut_value
    self.date ||= current_time
    self.status ||= 'new'
  end
end
