class AdminPolicy < ApplicationPolicy
  def dashboard?
    user.admin?
  end

  def public_access?
    user.admin?
  end

  def vendor_access?
    user.admin?
  end

  class Scope < ApplicationPolicy::Scope
  end
end
