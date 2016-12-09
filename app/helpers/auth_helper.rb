module AuthHelper
  def current_user
    @current_user ||= AccessToken.find_by(access_token: session[:access_token]).try(:user)
  end

  def authenticate?
    render 'auth/create', object: @user = User.new unless current_user
  end

  def generate_access_token(user = nil)
    "#{ Digest::MD5::hexdigest(user.try(:email).try(:downcase).to_s + Time.new.to_s) }"
  end
end
