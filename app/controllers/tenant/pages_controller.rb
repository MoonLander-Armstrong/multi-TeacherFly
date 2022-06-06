class Tenant::PagesController < Tenant::BaseController
  # remember to detect teacher sign_in?

  def auto_sign_in
    sign_in MultiTenantSupport.current_tenant
    redirect_to owner_courses_path
  end

  def update_sign_in
    sign_in MultiTenantSupport.current_tenant
    redirect_to owner_courses_path, notice: "更新成功"
  end
end
