class ApplicationController < ActionController::Base
  include Pundit::Authorization
  layout :layout_by_subdomain
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  rescue_from Pundit::NotAuthorizedError, with: :no_permission
  rescue_from Pundit::InvalidConstructorError, with: :no_permission

  private

  def not_found
    render file: "#{Rails.root}/public/404.html", status: 404, layout: false
  end

  def after_sign_in_path_for(resource)
    root_path
  end

  def layout_by_subdomain
    if request.subdomain.present? && request.subdomain != "www"
      "tenant"
    else
      "application"
    end
  end
end
