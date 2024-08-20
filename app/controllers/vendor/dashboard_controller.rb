class Vendor::DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :require_vendor

  def index
  end

  private

  def require_vendor
    redirect_to root_path unless current_user.vendor?
    flash[:alert] = "You are not a Vendor"
  end
end
