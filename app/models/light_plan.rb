class LightPlan < ApplicationRecord
  before_save :defaut_value

  private
    def defaut_value
      self.date ||= current_time
      self.status ||= 'pending'
    end
end
