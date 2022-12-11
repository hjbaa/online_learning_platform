class Teacher::QuestionsController < Teacher::BaseController
  def create
    @question = Test.find(params[:test_id]).questions.create(question_params)
  end

  private

  def question_params
    params.require(:question).permit(:type, :title)
  end
end
