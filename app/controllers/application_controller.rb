class ApplicationController < ActionController::Base
  layout :layout_by_subdomain
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private

  def not_found
    render file: "#{Rails.root}/public/404.html", status: 404, layout: false
  end

  def layout_by_subdomain
    if request.subdomain.present? && request.subdomain != "www"
      "tenant"
    else
      "application"
    end
  end

  def after_sign_in_path_for(resource)
    root_path
  end
end
