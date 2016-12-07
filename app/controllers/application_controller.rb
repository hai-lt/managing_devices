class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include AuthHelper

  def admin_authentication?
    authenticate?
    render 'errors/permission_denied' unless @current_user.admin?
    @current_user
  end
end
