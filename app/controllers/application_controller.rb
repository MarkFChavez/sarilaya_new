class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource)
  	if resource.admin?
  		admin_dashboard_index_url
  	else
  		home_index_url
  	end
  end
end
