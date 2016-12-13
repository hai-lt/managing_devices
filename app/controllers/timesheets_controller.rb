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

    respond_to do |f|
      f.html { }
      f.js { render 'edit' }
    end
  end

  def create
    @timesheet = Timesheet.create(permit_params)
    @timesheets = Timesheet.all.order('date desc')

    respond_to do |f|
      f.html { }
      f.js { render 'create' }
    end
  end

  def edit
    @timesheet = Timesheet.find(params[:id])

    respond_to do |f|
      f.html { }
      f.js { render 'edit' }
    end
  end

  def update
    @timesheet = Timesheet.find(params[:id])
    @timesheet.update!(permit_params.merge!(date: current_time).merge!(status: 'reuse'))
    @timesheets = Timesheet.all.order('date desc')
    respond_to do |f|
      f.html { }
      f.js { render 'index' }
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
