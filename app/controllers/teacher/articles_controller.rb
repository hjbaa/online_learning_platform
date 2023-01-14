# frozen_string_literal: true
class Teacher::ArticlesController < Teacher::BaseController
  before_action :find_article, only: %i[show edit update destroy start]
  before_action :find_subject, only: %i[new create]

  def index
    @articles = Article.where(type: 'Public')
  end

  def new
    @article = @subject.articles.new
  end

  def create
    @article = @subject.articles.new(article_params.merge(author: current_user))

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
    redirect_to teacher_subject_path(@article.subject)
  end

  def show
    if @article.test.present?
      @test = @article.test
    else
      @test = Test.new(author: current_user, testable: @article)
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

  def find_subject
    @subject = Subject.find(params[:subject_id])
  end
end
