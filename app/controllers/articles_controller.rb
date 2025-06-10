class ArticlesController < ApplicationController
  def index
    @articles = Article.all.order(created_at: :desc)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to article_by_slug_path(@article.slug)
    else
      render :new
    end
  end

  def update
    @article = Article.find_by(slug: params[:slug])
    if @article.update(article_params)
      redirect_to article_by_slug_path(@article.slug)
    else
      render :edit
    end
  end

  def show
    @article = Article.find_by(slug: params[:slug])
  end

  def edit
    @article = Article.find_by(slug: params[:slug])
  end

  def destroy
    @article = Article.find_by(slug: params[:slug])
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :description, :body, :tag_list)
  end
end
