class ConsultationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def edit?
    true
  end

  def update?
    edit?
  end

  def destroy?
    true
  end

end
