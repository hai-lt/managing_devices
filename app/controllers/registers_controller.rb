class RegistersController < ApplicationController
  before_action :authenticate?

  def index
    @register_devices = @current_user.admin? ? RegisterDevice.all : RegisterDevice.where(user: @current_user)
  end

  def update
    @register = RegisterDevice.find(params[:id])
    if permit_params.include?(:status)
      @register.update(permit_params) if admin_authentication?
    else
      @register.update(permit_params)
    end

    respond_to do |format|
      format.html { redirect_to registers_path }
      format.js { }
    end
  end

  def destroy
    if @current_user.admin?
      RegisterDevice.find(params[:id]).destroy
    else
      RegisterDevice.find_by!(id: params[:id], user_id: @current_user.id).destroy
    end

    respond_to do |format|
      format.html { redirect_to registers_path }
      format.js { }
    end
  end

  def edit
  end

  def create
    params[:register_device].merge!(device_id: params[:id])
    @register_device = RegisterDevice.new(permit_params.merge!(user_id: @current_user.id))
    if @register_device.save
      respond_to do |format|
        format.html { redirect_to registers_path }
        format.js { }
      end
    end
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
      params.require(:register_device).permit(:reason, :device_id, :from, :to, :id, :status)
    end
end
