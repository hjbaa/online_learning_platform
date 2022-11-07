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
      redirect_to teacher_article_path(@article)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @article.update(article_params)
      flash[:success] = 'Article was updated!'
      redirect_to teacher_article_path(@article)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    flash[:success] = 'Article was destroyed!'
    redirect_to teacher_articles_path
  end

  def show
    if @article.test.present?
      @test = @article.test
    else
      @test = Test.new(author: current_user, article: @article)
      @questions = @test.questions.build
      @answers = @questions.answers.build
    end
  end

  def edit; end

  private

  def article_params
    params.require(:article).permit(:title, :body, :type, :description, files: [])
  end

  def find_article
    @article = Article.with_attached_files.find(params[:id])
  end
end
