class LecturerPolicy < ApplicationPolicy
  def index?
    teacher
  end

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
