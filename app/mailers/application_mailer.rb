# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'TeacherFly@teacherfly.site'
  layout 'mailer'
end
