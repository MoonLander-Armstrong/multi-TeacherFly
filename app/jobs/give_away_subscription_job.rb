class GiveAwaySubscriptionJob < ApplicationJob
  queue_as :default

  def perform(student, teacher, order)
    SubscriptionMailer.give_away_subscription(student, teacher, order).deliver
  end
end
