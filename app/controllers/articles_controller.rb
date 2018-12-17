class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]

  def index
    @articles = Article.all
   end

   def set_article
     @article = Article.find(params[:id])
    end

  def new
    require_user
    @article = Article.new
  end

  def create
    require_user
    current_user
    @article = Article.new(article_params)
    @article.user_id = @current_user.id
    if @article.save
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
    require_user
  end

  def update
    require_user
    if @article.update(article_params)
     flash[:notice] = "Article was updated"
     redirect_to article_path(@article)
    else
     render 'edit'
    end
   end

   def destroy
     require_user
     @article.destroy
     flash[:notice] = "Article was deleted"
     redirect_to articles_path
   end

  private
    def article_params
      params.require(:article).permit(:title, :description)
    end

end
