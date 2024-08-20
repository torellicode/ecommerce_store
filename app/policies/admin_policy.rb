class AdminPolicy < ApplicationPolicy
  def access?
    user.admin?
  end

  class Scope < ApplicationPolicy::Scope
  end
end
