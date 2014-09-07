class ProjectPolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def create?
    true
  end

  def update?
    is_owner?
  end

  def destroy?
    is_owner?
  end

  private
    def is_owner?
      user == record.user
    end

end
