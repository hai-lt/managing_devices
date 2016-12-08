class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include AuthHelper

  def admin_authentication?
    current_user
    render 'auth/create', object: @user = User.new unless @current_user && @current_user.admin?
    @current_user
  end
end
