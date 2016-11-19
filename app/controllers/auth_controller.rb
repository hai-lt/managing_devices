class AuthController < ApplicationController
  def login
    @user = User.find_by(permit_params[:email])
    raise errors unless @user.authenticate(permit_params[:password])
    access_token = generate_access_token(@user)
    AccessToken.create!(access_token: access_token, user: @user)
    if permit_params[:remember_me]
      cookies[:access_token] = {
        key: access_token,
        expired: Time.now.next_month
      }
    else
      #save in session
    end
    render '/'  #home page
  end

  def signup
    @user = User.new(signup_permit)
    if @user.save
      render '/' #home page
    else
      raise errors
    end
  end

  def forgot_password
    if params[:key]

    end
    #send email to permit_params[:email]
    # attach a link to reset passwod
  end

  private
    def permit_params
      params.permit(:email, :password, :remember_me)
    end

    def signup_permit
      params.permit(:email, :password, :password_confirmation)
    end

    def generate_access_token(user)
      Digest::MD5::hexdigest(user.email.downcase + Time.new.to_i.to_s)
    end

    def current_user
      @current_user ||= AccessToken.find_by(access_token: cookies[:access_token]).try(:user)
    end
end
