class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include AuthHelper
  include SystemconfigHelper
end
