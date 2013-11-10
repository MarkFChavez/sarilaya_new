class ApplicationController < ActionController::Base
  protect_from_forgery

  layout :layout

  def after_sign_in_path_for(resource)
  	if resource.admin?
  		admin_dashboard_index_url
  	else
  		home_index_url
  	end
  end

  def layout
  	if devise_controller?
  		"devise"
  	else
  		"application"
  	end
  end
end
