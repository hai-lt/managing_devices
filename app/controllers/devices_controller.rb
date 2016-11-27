class DevicesController < ApplicationController
  before_action :get_device, only: [:show, :edit, :update, :destroy]

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
  end

  def update
    @device.save!
  end

  def new
    @device = Device.new
  end

  private

    def permit_params
      params.permit(:id)
    end

    def get_device
      @device = Device.find(params[:id])
    end
end
