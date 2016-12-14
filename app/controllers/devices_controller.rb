class DevicesController < ApplicationController
  before_action :get_device, only: [:show, :edit, :update, :destroy]
  before_action :authenticate?
  def create
    admin_authentication?
    binding.pry
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
    @device = Device.find(params[:id])

    respond_to do |f|
      f.html {}
      f.js { render 'new' }
    end
  end

  def destroy
    @device.destroy
    redirect_to devices_path
  end

  def update
    @device = Device.find(params[:id])
    @device.update(permit_params)

    redirect_to device_path
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
      params.require(:device).permit(:id, :category_id, :name, :desc, :brand,:price, {photos: []})
    end

    def get_device
      @device = Device.find(params[:id])
    end
end
