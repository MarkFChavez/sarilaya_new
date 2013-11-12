class Admin::ArticlesController < Admin::ApplicationController
  before_filter :set_current_page

  def index
  	@articles = Article.all
  end

  def show
  	@article = current_user.articles.find(params[:id])
  end

  def new
  	@article = Article.new
  end

  def create
  	@article = current_user.articles.build(params[:article])

  	if @article.save
  		redirect_to admin_articles_path, notice: "Article created successfully"
  	else
  		render :new
  	end
  end

  private

	def set_current_page
		@current_page = "Articles"
	end
end
