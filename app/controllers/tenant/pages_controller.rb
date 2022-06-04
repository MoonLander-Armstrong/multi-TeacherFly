class Tenant::PagesController < Tenant::BaseController
  # remember to detect teacher sign_in?
  def home
    sign_in MultiTenantSupport.current_tenant
  end
end
