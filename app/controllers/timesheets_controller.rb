class TimesheetsController < ApplicationController
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
    @timesheet.update!(permit_params)

    respond_to do |f|
      f.html { }
      f.js { render 'update' }
    end
  end

  def destroy
    @timesheet = Timesheet.find(params[:id]).destroy

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
