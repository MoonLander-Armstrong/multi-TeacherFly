MultiTenantSupport.configure do
  model do |config|
    config.tenant_account_class_name = 'Teacher'
    config.tenant_account_primary_key = :id
  end

  controller do |config|
    config.current_tenant_account_method = :current_tenant_account
  end

  app do |config|
    config.excluded_subdomains = ['www']
    config.host = 'teacherfly.site'
  end

  console do |config|
    config.allow_read_across_tenant_by_default = false
  end
end

# Uncomment if you are using sidekiq without ActiveJob
# require 'multi_tenant_support/sidekiq'

# Uncomment if you are using ActiveJob
# require 'multi_tenant_support/active_job'
