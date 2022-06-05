class Tenant::PagesController < Tenant::BaseController
  # remember to detect teacher sign_in?
  def home; end

  def auto_sign_in
    sign_in MultiTenantSupport.current_tenant
    redirect_to owner_courses_path
  end
end
