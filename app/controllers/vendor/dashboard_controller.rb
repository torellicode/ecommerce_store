class Vendor::DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :require_vendor

  def index
  end

  private

  def require_vendor
    unless current_user.vendor?
      redirect_to root_path
      flash[:alert] = "You are not a Vendor"
    end
  end
end
