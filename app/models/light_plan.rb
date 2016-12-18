class LightPlan < ApplicationRecord
  before_save :defaut_value

  def sensor_status
    status = 'Enable'
    status = 'Disable' unless sensor
    status
  end
  private
    def defaut_value
      self.date ||= DateTime.now
      self.status ||= 'pending'
    end
end
