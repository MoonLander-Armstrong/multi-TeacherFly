class Tenant::BaseController < ApplicationController
  before_action :found_tanent_app

  private

  def found_tanent_app
    not_found unless MultiTenantSupport.current_tenant
  end
end
