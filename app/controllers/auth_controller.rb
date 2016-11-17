class AuthController < ApplicationController
  def login
    @user = User.find_by(permit_params[:email])
    raise errors unless @user.authenticate(permit_params[:password])
    access_token = generate_access_token(@user)
    AccessToken.create!(access_token: access_token, user: @user)
    if permit_params[:remember_me]
      session
    else

    end

  end

  def signup
    
  end

  private
    def permit_params
      params.permit(:email, :password, :remember_me)
    end

    def generate_access_token(user)
      Digest::MD5::hexdigest(user.email.downcase + Time.new.to_i.to_s)
    end

    def current_user
      @current_user ||= User.find_by(cookies[:access_token])
    end
end
