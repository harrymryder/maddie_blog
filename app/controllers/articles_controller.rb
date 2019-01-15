class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, except: [:new, :edit]
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.order(created_at: :desc)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to articles_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @article.update(article_params)
    if @article.save
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:author, :title, :content, :created_at, :photo)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
