# frozen_string_literal: true

class Teachers::PasswordsController < Devise::PasswordsController
  skip_before_action :set_current_tenant_account
end
