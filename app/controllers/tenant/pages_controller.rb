class Tenant::PagesController < Tenant::BaseController
  # skip_before_action :authenticate_user!

  # remember to detect teacher sign_in?
  def home
    sign_in MultiTenantSupport.current_tenant
  end
end
