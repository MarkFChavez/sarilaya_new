class Admin::DashboardController < Admin::ApplicationController
	before_filter :set_current_page

	def index
		
	end

	private

	def set_current_page
		@current_page = "Home"
	end
end
