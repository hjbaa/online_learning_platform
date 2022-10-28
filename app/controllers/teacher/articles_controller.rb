# frozen_string_literal: true
class Teacher::ArticlesController < Teacher::BaseController
  before_action :find_article, only: %i[show edit update destroy start update_inline]

  def index
    @articles = Article.all
  end

  def new
    @article = current_user.created_articles.new
  end

  def create
    @article = current_user.created_articles.new(article_params)

    if @article.save
      flash[:success] = 'Your Article successfully created.'
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @article.update(article_params)
      flash[:success] = 'Article was updated!'
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    flash[:success] = 'Test was destroyed!'
    redirect_to root_path
  end

  def show; end

  def edit; end

  private

  def article_params
    params.require(:article).permit(:title, :body, :type)
  end

  def find_article
    @article = Article.find(params[:id])
  end
end
