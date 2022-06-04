# frozen_string_literal: true

class Teachers::ConfirmationsController < Devise::ConfirmationsController
  skip_before_action :set_current_tenant_account
end
