class UsersController < ApplicationController
  before_action :authenticate?
  def new
    @user = User.new
    respond_to do |f|
      f.html { }
      f.js { render 'edit' }
    end
  end

  def edit
    @user = User.find(params[:id])

    respond_to do |f|
      f.html { }
      f.js { render 'edit' }
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(permit_params)

    respond_to do |f|
      f.html { }
      f.js { render 'update' }
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy!
    respond_to do |f|
      f.html { }
      f.js { render 'destroy' }
    end
  end

  def create
    user_params.merge!(position_id: Position.first.id) if (user_params = permit_params).include?(:position_id)
    @user = User.create!(permit_params)
    respond_to do |f|
      f.html { }
      f.js { render 'create' }
    end
  end

  private

    def permit_params
      params.require(:user).permit(:email, :password, :password_confirmation, :position_id, :role, :phone, :address, :name)
    end
end
