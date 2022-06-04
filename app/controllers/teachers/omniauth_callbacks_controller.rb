# frozen_string_literal: true

class Teachers::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :set_current_tenant_account

  def google_oauth2
    @teacher = Teacher.create_from_provider_data(request.env['omniauth.auth'])

    if @teacher.persisted?
      flash[:notice] = I18n.t 'teachers.omniauth_callbacks.success', kind: 'Google'
      sign_in_and_redirect @teacher, event: :authentication
    else
      session['devise.google_data'] = request.env['omniauth.auth']
      redirect_to new_teacher_registration_url
    end
  end

  def failure
    flash.now[:alert] = '無法獲得驗證！'
    redirect_to root_path
  end
end
