class DevicesController < ApplicationController
  before_action :get_device, only: [:show, :edit, :update, :destroy]

  def create
    admin_authentication?
    device = Device.create!(permit_params)

    respond_to do |format|
      format.html { redirect_to devices_path }
      format.js { }
    end
  end

  def show
  end

  def index
    authenticate?
    @devices = Device.all
  end

  def edit
  end

  def destroy
    @device.destroy
    redirect_to devices_path
  end

  def update
    @device.save!
  end

  def new
    @device = Device.new

    respond_to do |format|
      format.html { }
      format.js { }
    end
  end

  private

    def permit_params
      params.require(:device).permit(:id, :category_id, :name, :desc, :brand,:price)
    end

    def get_device
      @device = Device.find(params[:id])
    end
end
