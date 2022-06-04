class CoursePolicy < ApplicationPolicy
  attr_reader :user, :course

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
    owner_teacher
  end

  def destroy?
    owner_teacher
  end

  def information?
    owner_teacher
  end

  def comments?
    owner_teacher
  end

  def curriculum?
    owner_teacher
  end
end
