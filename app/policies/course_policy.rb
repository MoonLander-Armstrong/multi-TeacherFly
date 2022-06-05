class CoursePolicy < ApplicationPolicy
  def index?
    teacher
  end

  def new?
    create?
  end

  def create?
    teacher
  end

  def update?
    teacher
  end

  def destroy?
    teacher
  end

  def information?
    teacher
  end

  def curriculum?
    teacher
  end
end
