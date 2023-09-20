class Admins::BaseController < ApplicationController
  before_action :authorized
  before_action :check_roles

  def check_roles
    unless @current_user.admin?
      flash[:danger] = "not permission"
    end
  end
end
