module AuthHelper
  def current_user
    @user = AccessToken.find_by!('access_token = ? and expired > ?', session[:access_token], DateTime.now)
  end
end
