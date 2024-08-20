class UserPolicy < ApplicationPolicy
  def become_vendor?
    user.standard?
  end


  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
