# frozen_string_literal: true

class Tenant::Students::SessionsController < Devise::SessionsController
  MultiTenantSupport.without_current_tenant do
    def log_out
      session.clear
      redirect_to root_path
    end
  end
end
