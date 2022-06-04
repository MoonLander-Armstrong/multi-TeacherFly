# frozen_string_literal: true

class Teachers::SessionsController < Devise::SessionsController
  skip_before_action :set_current_tenant_account
end
