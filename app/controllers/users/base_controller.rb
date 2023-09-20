class Authorizations::BaseController < ApplicationController
  before_action :authorized
end
