class RegistersController < ApplicationController
  before_action :get_object, only: [:edit, :show]

  def index
    @register_devices = RegisterDevice.all
  end

  def update
    if @register_device.save!
      redirect_to :index
    else
      render 'edit'
    end
  end

  def destroy
    @register_device.destroy
  end

  def edit

  end

  def new
    @register_device = RegisterDevice.new
  end

  private

    def get_object
      @register_device = RegisterDevice.find_by(permit_params[:register_device][:id])
    end

    def permit_params
      params.require(:register_device).permit(:reason, :device_id, :from, :to, :id)
    end
end
