class SectionPolicy < ApplicationPolicy
  def new?
    create?
  end

  def create?
    teacher
  end

  def edit?
    update?
  end

  def update?
    teacher
  end

  def destroy?
    teacher
  end
end
