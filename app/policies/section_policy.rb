class SectionPolicy < ApplicationPolicy
  attr_reader :user, :course

  def initialize(user, course)
    @user = user
    @course = course
  end

  def new?
    create?
  end

  def create? 
    owner_teacher
  end

  def edit?
    update?
  end
  
  def update?
    owner_teacher
  end

  def destroy?
    owner_teacher
  end


  private
  def owner_teacher
    user && user.role == "teacher" && user == course.user
  end
end
