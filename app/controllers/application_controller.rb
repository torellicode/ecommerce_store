class ApplicationController < ActionController::Base
  include Pundit::Authorization

  # Uncomment or add this line if you want to rescue from Pundit errors globally
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end
