# frozen_string_literal: true

class Teachers::RegistrationsController < Devise::RegistrationsController
  skip_before_action :set_current_tenant_account
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  def create
    teacher = Teacher.new(configure_sign_up_params)

    if teacher.save
      flash[:notice] = I18n.t 'teachers.registrations.signed_up'
      redirect_to new_teacher_session_path
    else
      flash.now[:alert] = "請輸入正確資訊"
      render :new
    end
  end

  private

  def configure_sign_up_params
    params.require(:teacher).permit(:username, :email, :password, :password_confirmation).merge(domain: request.domain, subdomain: SecureRandom.hex(3))
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end
end
