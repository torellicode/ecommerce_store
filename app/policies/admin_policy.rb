class AdminPolicy < ApplicationPolicy
  def access?
    user.admin?
  end

  def manage_categories?
    user.admin?
  end

  class Scope < ApplicationPolicy::Scope
  end
end
