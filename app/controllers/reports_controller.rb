class ReportsController < ApplicationController
  before_action :authenticate?

  def index
    @reports = ReportDevice.where(user: @current_user).order(:created_at)
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
    ReportDevice.find_by!(id: params[:id], user_id: @current_user.id).destroy
    redirect_to reports_path
  end

  def edit
    @report = ReportDevice.find_by(id: params[:id])
  end

  def new
    @device = Device.find(params[:id])
    @ranks = Rank.all.order(:level)
    @report = ReportDevice.new
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
      params.require(:report).permit(:desc, :rank_id, :device_id)
    end
end
