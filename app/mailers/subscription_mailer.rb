class SubscriptionMailer < ApplicationMailer
  def registered_member(user, teacher)
    @user = user
    @teacher = teacher
    mail to: "gian910147@gmail.com", subject: "您已經成為了TeacherFly的會員了"
  end

  def give_away_subscription(user, teacher, order)
    @user = user
    @teacher = teacher
    @order = order
    mail to: "gian910147@gmail.com", subject: "您已經獲得了一堂課程"
  end
end
