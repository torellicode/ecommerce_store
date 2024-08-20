class Users::VendorOnboardingsController < ApplicationController
  before_action :authenticate_user!

  def new
    authorize(current_user, :become_vendor?)
  end

  def create
    authorize(current_user, :become_vendor?)
    if current_user.update(role: 'vendor')
      redirect_to vendor_dashboard_path, notice: 'Onboarding complete, you are now a Vendor'
    else
      render :new, alert: 'There was a problem with your request to become a Vendor'
    end
  end
end
