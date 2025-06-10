class ArticlesController < ApplicationController
  before_action :correct_user, only: [ :edit, :update, :destroy ]
  def index
    @articles = Article.all.order(created_at: :desc).page(params[:page]).per(5)
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to article_path(@article), notice: "記事が作成されました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @article = Article.find_by(slug: params[:slug])
  end

    def update
      @article = Article.find_by(slug: params[:slug])
      if @article.update(article_params)
        redirect_to article_by_slug_path(@article.slug)
      else
        render :edit
      end
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

    def set_article
      @article = Article.find_by!(slug: params[:slug])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path, alert: "指定された記事が見つかりませんでした。"
    end

    def correct_user
      @article = Article.find_by(slug: params[:slug])
      unless logged_in? && current_user == @article.user
        redirect_to root_path, alert: "権限がありません。"
      end
    end

    def article_params
      params.require(:article).permit(:title, :description, :body, :tag_list, :slug)
    end
end
