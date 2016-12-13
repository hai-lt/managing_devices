class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def current_time
    Time.at(Time.now.utc + Time.zone_offset('ICT'))
  end
end
