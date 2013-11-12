class Admin::ArticlesController < Admin::ApplicationController
  before_filter :set_current_page

  def index
  	@articles = Article.paginate(page: params[:page])
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

  def edit
  	@article = current_user.articles.find(params[:id])
  end

  def update
  	@article = current_user.articles.find(params[:id])

  	if @article.update_attributes(params[:article])
  		redirect_to [:admin, @article], notice: "Article updated successfully"
  	else
  		render :edit
  	end
  end

  def publish
  	@article = current_user.articles.find(params[:id])

  	if @article.update_attribute("published", true)
  		redirect_to admin_articles_path, notice: "Article has been published"
  	else
  		redirect_to admin_articles_path, notice: "Error occurred when publishing article. Please check with admin"
  	end
  end

  def unpublish
  	@article = current_user.articles.find(params[:id])
  	
  	if @article.update_attribute("published", false)
  		redirect_to admin_articles_path, notice: "Article has been unpublished"
  	else
  		redirect_to admin_articles_path, notice: "Error occurred when unpublishing article. Please check with admin"
  	end
  end

  private

	def set_current_page
		@current_page = "Articles"
	end
end
