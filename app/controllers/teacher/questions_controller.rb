class Teacher::QuestionsController < Teacher::BaseController
  before_action :find_question, only: %i[show destroy update]
  def create
    @question = Test.find(params[:test_id]).questions.create(question_params)
  end

  def show; end

  def destroy
    @question.destroy
  end

  def update
    puts "\n\n\n"
    puts params
    puts "\n\n\n"
    @question.update(question_params)
  end

  private

  def question_params
    params.require(:question).permit(:type, :title)
  end

  def find_question
    @question = Question.find(params[:id])
  end
end
