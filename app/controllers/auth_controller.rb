class AuthController < ApplicationController
  def login
    user = User.find_by(email: permit_params[:email])
    if user.present? && user.authenticate(permit_params[:password])
      token = generate_access_token(user)
      AccessToken.create!(access_token: token, user: user)
      session[:access_token] = token
      redirect_to devices_path
    else
      @user = User.new
      render 'login'
    end
  end

  def signup
  end

  def create
    @user = User.new
  end

  def forgot_password
    if params[:key]
    end
  end

  private
    def permit_params
      params.require(:user).permit(:email, :password, :remember_me)
    end

    def signup_permit
      params.permit(:email, :password, :password_confirmation)
    end

end
