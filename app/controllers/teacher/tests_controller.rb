class Teacher::TestsController < Teacher::BaseController
  before_action :find_test, only: %i[destroy edit update]

  def new
    @subject = Subject.find(params[:subject_id])
    @test = @subject.tests.new(author_id: current_user.id)
  end

  def create
    @test = Test.create(test_params)

    respond_to do |format|
      format.js
      format.html { redirect_to teacher_test_path(@test) }
    end
  end

  def destroy
    @test.destroy
    redirect_to teacher_article_path(@test.testable)
  end

  def edit; end

  def update
    @test.update(test_params)
  end

  def show
    @test = Test.includes(:questions).find(params[:id])
    @question = Question.new
  end

  private

  def test_params
    params.require(:test).permit(:title, :author_id, :testable_type, :testable_id, :seconds_for_passage,
                                 questions_attributes: [:title, { answers_attributes: %i[content correct description] }])
  end

  def find_test
    @test = Test.find(params[:id])
  end
end
