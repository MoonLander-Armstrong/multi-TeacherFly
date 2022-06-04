class UserPolicy < ApplicationPolicy
  def index?
    teacher
  end

  def information?
    teacher
  end

  def update?
    teacher
  end
end
