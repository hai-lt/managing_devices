class RegistersController < ApplicationController
  before_action :authenticate?

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
    binding.pry
    RegisterDevice.find(params[:id]).destroy
    redirect_to registers_path
  end

  def edit

  end

  def create
    binding.pry
    params[:register_device].merge!(device_id: params[:id])
    @register_device = RegisterDevice.new(permit_params.merge!(user_id: @current_user.id))
    render 'new' unless @register_device.save
    redirect_to registers_path
  end

  def new
    @device = Device.find(params[:id])
    @lessons = Lesson.all
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
