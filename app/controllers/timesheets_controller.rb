class TimesheetsController < ApplicationController
  before_action :authenticate?
  def index
    @timesheets = Timesheet.all

    respond_to do |f|
      f.html { }
      f.js {  }
    end
  end

  def new
    @timesheet = Timesheet.new
    @timesheet.date = DateTime.now + 7.hours

    respond_to do |f|
      f.html { }
      f.js { render 'edit' }
    end
  end

  def create
    date = Timesheet.new(permit_params).date - 7.hours
    @timesheet = Timesheet.new(permit_params)
    @timesheet.date = date
    success = @timesheet.save
    @timesheets = Timesheet.all.order('date desc')

    respond_to do |f|
      if success
        f.html { }
        f.js { render 'create' }
      else
        f.html { }
        f.js { render 'errors/failed' }
      end
    end
  end

  def edit
    @timesheet = Timesheet.find(params[:id])
    @timesheet.date += 7.hours

    respond_to do |f|
      f.html { }
      f.js { render 'edit' }
    end
  end

  def update
    date = Timesheet.new(permit_params).date - 7.hours
    @timesheet = Timesheet.find(params[:id])
    if @timesheet.status == 'pending'
      success = @timesheet.update(date: date, turn_on: permit_params[:turn_on], turn_off: permit_params[:turn_off])
    else
      @timesheet = Timesheet.new(permit_params)
      @timesheet.date = date
      success = @timesheet.save
    end
    @timesheets = Timesheet.all.order('date desc')
    respond_to do |f|
      if success
        f.html { }
        f.js { render 'index' }
      else
        f.html { }
        f.js { render 'errors/failed' }
      end
    end
  end

  def destroy
    @timesheet = Timesheet.find(params[:id]).destroy
    @timesheets = Timesheet.all.order('date desc')
    respond_to do |f|
      f.html { }
      f.js { render 'destroy' }
    end
  end

  private

    def permit_params
      params.require(:timesheet).permit(:status, :date, :turn_on, :turn_off)
    end
end
