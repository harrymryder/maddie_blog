class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @article = Article.new

    @articles = Article.all
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to articles_path
    else
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :created_at, :photo)
  end
end
