class Users::BaseController < ApplicationController
  before_action :authorized
end
