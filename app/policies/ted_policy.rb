class TedPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    true
  end

  def create?
    user.admin?
  end

  def check_code?
    true
  end
end
