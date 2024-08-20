class Vendor::DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_vendor_or_admin

  def index
  end

  private

  def authorize_vendor_or_admin
    authorize(:vendor, :access?)
  end
end
