class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include AuthHelper

  def admin_authentication?
    if current_user
      render 'errors/permission_denied' unless @current_user.admin?
    else
      render 'auth/create', object: @user = User.new
    end
    @current_user
  end

  def current_time
    Time.at(Time.now.utc)
  end
end
