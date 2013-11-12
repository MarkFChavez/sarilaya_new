class Admin::ArticlesController < Admin::ApplicationController
  before_filter :set_current_page

  def index
  	@articles = Article.all
  end

  def new
  	@article = Article.new
  end

  private

	def set_current_page
		@current_page = "Articles"
	end
end
