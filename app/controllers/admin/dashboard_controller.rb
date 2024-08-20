class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin

  def index
  end

  private

  def require_admin
    redirect_to root_path unless current_user.admin?
    flash[:alert] = "You are not an Admin"
  end
end
