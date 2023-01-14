module Teacher::QuestionsHelper
  def allowed_types
    [
      ['Multiple choice question', 'MultipleChoice'],
      ['Single choice question', 'SingleChoice'],
      ['No choice question', 'NoChoice']
    ]
  end

  def type(question)
    case question.type
    when 'MultipleChoice'
      'Question with multiple choice'
    when 'SingleChoice'
      'Question with single choice'
    else
      'Question without choice'
    end
  end
end
