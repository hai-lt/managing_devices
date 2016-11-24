class AuthController < ApplicationController
  def login
    binding.pry
    user = User.find_by(email: permit_params[:email])
    if user.authenticate(permit_params[:password])
      token = generate_access_token(user)
      AccessToken.create!(access_token: token, user: user)
      session[:access_token] = token
      redirect_to 'devices#index'
    else
      render 'new'
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
    #send email to permit_params[:email]
    # attach a link to reset password
  end

  private
    def permit_params
      params.permit(:email, :password, :remember_me)
    end

    def signup_permit
      params.permit(:email, :password, :password_confirmation)
    end

    def generate_access_token(user = nil)
      "#{ Digest::MD5::hexdigest(user.try(:email).try(:downcase).to_s + Time.new.to_s) }"
    end

    def current_user
      @current_user ||= AccessToken.find_by(access_token: cookies[:access_token]).try(:user)
    end
end
