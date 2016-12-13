class LightPlan < ApplicationRecord
  before_save :defaut_value

  private
    def defaut_value
      self.date ||= DateTime.now
      self.status ||= 'new'
    end
end
