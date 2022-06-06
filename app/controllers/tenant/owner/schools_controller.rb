class Tenant::Owner::SchoolsController < Tenant::BaseController
  layout "owner"
  before_action :find_teacher, only: [:edit, :update]
  def edit; end

  def update
    if @teacher.update(school_params)
      session.clear
      redirect_to teacher_auto_sign_in_url(subdomain: current_teacher.subdomain)
    else
      render :edit
    end

  end


  private
  def school_params
    params.require(:teacher).permit(:school_name, :avatar, :logo, :subdomain, :email, :username)
  end

  def find_teacher
    @teacher = current_teacher
  end

end
