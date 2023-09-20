class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionHelper

  def current_user
    return unless session[:user_id]
    
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def authorized
    redirect_to login_path unless logged_in?
  end

  def logged_in?
    !current_user.nil?
  end
end
