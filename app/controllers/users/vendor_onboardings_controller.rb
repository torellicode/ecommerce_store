class Users::VendorOnboardingsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_standard_user

  def new
  end

  def create
    if current_user.update(role: 'vendor')
      redirect_to vendor_dashboard_path, notice: 'Onboarding complete, you are now a Vendor'
    else
      render :new, alert: 'There was a problem with your request to become a Vendor'
    end
  end

  private

  def ensure_standard_user
    if current_user.vendor? || current_user.admin?
      redirect_to root_path 
      flash[:alert] = "Your account has already been upgraded"
    end
  end
end
