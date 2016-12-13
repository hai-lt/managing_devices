class Timesheet < ApplicationRecord
  before_save :defaut_value

  def defaut_value
    self.date ||= self.created_at
    self.status ||= 'new'
  end
end
