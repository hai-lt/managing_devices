class ReportsController < ApplicationController
  before_action :authenticate?

  def index
    @reports = @current_user.admin? ? ReportDevice.all : ReportDevice.where(user: @current_user)
    @reports = @reports.order(:created_at)
  end

  def update
    @report = ReportDevice.find_by(id: params[:id])
    if @report.present? && @report.update(permit_params)
      redirect_to reports_path
    else
      render 'edit'
    end
  end

  def destroy
    report = @current_user.admin? ? ReportDevice.find(params[:id]) : ReportDevice.find_by!(user: @current_user, id: params[:id])
    if report.destroy
      redirect_to reports_path
    else
      render 'index'
    end
  end

  def edit
    @device = Device.find(params[:id])
    @ranks = Rank.all.order(:level)
    @report = ReportDevice.find(params[:id])

    respond_to do |f|
      f.html { }
      f.js { render 'new' }
    end
  end

  def new
    @device = Device.find(params[:id])
    @ranks = Rank.all.order(:level)
    @report = ReportDevice.new

    respond_to do |format|
      format.html { }
      format.js { }
    end
  end

  def create
    @report = ReportDevice.new(permit_params.merge!(user_id: @current_user.id))
    if @report.save
      redirect_to reports_path
    else
      redirect_to new_report_path(permit_params(:device_id))
    end
  end

  private

    def permit_params
      params.require(:report).permit(:desc, :rank_id, :device_id, :status)
    end
end
