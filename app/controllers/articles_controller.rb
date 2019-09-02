class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to artiapp/views/articles/new.html.erbcle_path(@article)
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
