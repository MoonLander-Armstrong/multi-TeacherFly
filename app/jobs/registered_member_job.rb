class RegisteredMemberJob < ApplicationJob
  queue_as :default

  def perform(student, teacher)
    SubscriptionMailer.registered_member(student, teacher).deliver
  end
end
