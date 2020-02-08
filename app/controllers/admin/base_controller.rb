class Admin::BaseController < ApplicationController
  layout "admin/admin"

  before_action :authenticate_user!

end
