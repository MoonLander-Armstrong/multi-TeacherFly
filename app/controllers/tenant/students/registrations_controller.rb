# frozen_string_literal: true

class Tenant::Students::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:information_update]

  def information; end

  def information_update
    if update_resource(current_student, configure_account_update_params)
      redirect_to teacher_root_path, notice: "更改密碼成功"
    else
      render :information, alert: "請輸入正確資訊"
    end
  end

  private

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  def configure_account_update_params
    params.require(:student).permit(:email, :username, :password, :password_confirmation, :current_password, :avatar)
  end
end
