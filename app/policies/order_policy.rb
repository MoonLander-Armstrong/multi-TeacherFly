class OrderPolicy < ApplicationPolicy
  def index?
    teacher
  end
end
