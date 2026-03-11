class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin_access

  def index
    # You can add any dashboard statistics here later
  end

end