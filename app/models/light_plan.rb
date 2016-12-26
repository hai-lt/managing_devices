class LightPlan < ApplicationRecord
  before_save :defaut_value
  validate :not_in_the_past

  def sensor_status
    status = 'Enable'
    status = 'Disable' unless sensor
    status
  end

  def not_in_the_past
    errors.add(:date, "can not set time in the past") if self.date.utc < DateTime.now.utc
  end

  private
    def defaut_value
      self.date ||= DateTime.now
      self.status ||= 'pending'
    end
end
