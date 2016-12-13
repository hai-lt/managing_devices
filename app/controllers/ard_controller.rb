class ArdController < ApplicationController
  def index
    binding.pry
    mode = LightPlan.where('date <= ?', DateTime.now)
                    .where(value: [1,10,100])
                    .where.not(status: 'cancel')
                    .order(:date)
                    .first
    timesheet = Timesheet.where('date <= ?', DateTime.now)
                         .where.not(status: 'cancel')
                         .order(:date)
                         .first
    render json: { mode: mode.value, green: timesheet.turn_on, yellow: timesheet.turn_off }
  end
end
