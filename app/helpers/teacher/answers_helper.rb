module Teacher::AnswersHelper
  def answer_form(question)
    case question.type
    when 'MultipleChoice'
      render 'teacher/answers/multiple_choice_form', question: @question
    when 'SingleChoice'
      render 'teacher/answers/single_option_form', question: @question
    else
      render 'teacher/answers/no_choice_form', question: @question
    end
  end
end
