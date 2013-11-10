class Admin::ApplicationController < ActionController::Base
	before_filter :authenticate_user!
	before_filter :admin_only

	layout "admin"

	protected
	
	def admin_only
		unless current_user.admin?
			redirect_to root_path, alert: "You do not have access on the administrator's page"
		end
	end
end
