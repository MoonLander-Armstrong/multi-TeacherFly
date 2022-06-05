class SubscriptionMailer < ApplicationMailer
  def registered_member(student, teacher)
    @student = student
    @teacher = teacher
    mail to: @student.email, subject: "您已經成為了TeacherFly的會員了"
  end

  def give_away_subscription(student, teacher, order)
    @student = student
    @teacher = teacher
    @order = order
    mail to: @student.email, subject: "您已經獲得了一堂課程"
  end
end
