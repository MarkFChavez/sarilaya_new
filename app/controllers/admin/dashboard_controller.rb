class Admin::DashboardController < ApplicationController
	before_filter :authenticate_user!
	before_filter :admin_only

	def index
	end

	private

	def admin_only
		unless current_user.admin?
			redirect_to root_path, alert: "You do not have access on the administrator's page"
		end
	end
end
