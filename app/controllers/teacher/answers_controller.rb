class Teacher::AnswersController < Teacher::BaseController
  def create
    @question = Question.find(params[:question_id])

    if params[:answer].instance_of? Array
      params[:answer].each do |attr|
        # With my realisation idk how to deal with unpermitted parameters, so i used this two hacks:
        # https://stackoverflow.com/questions/17335329/activemodelforbiddenattributeserror-when-creating-new-user
        # https://stackoverflow.com/questions/46029084/rails-unable-to-convert-unpermitted-parameters-to-hash
        unlocked_params = ActiveSupport::HashWithIndifferentAccess.new(attr.to_enum.to_h)
        @question.answers.create(unlocked_params)
      end
    else
      @question.answers.create(answer_params)
    end

    redirect_to teacher_question_path(@question)
  end

  private

  def answer_params
    params.require(:answer).permit(:content, :correct)
  end
end
