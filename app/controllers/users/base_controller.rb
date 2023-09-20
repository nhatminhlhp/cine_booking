class Users::BaseController < ApplicationController
  before_action :authorized
  before_action :check_roles

  def check_roles
    unless @current_user.user?
      flash[:danger] = "not permission"
      redirect_to admins_movies_path
    end
  end
end
