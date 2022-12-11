module Teacher::QuestionsHelper
  def allowed_types
    [
      ['Multiple option question', 'MultipleOptionQuestion'],
      ['Single option question', 'SingleOptionQuestion'],
      ['No option question', 'NoOptionQuestion']
    ]
  end

  def type(question)
    case question.type
    when 'MultipleOptionQuestion'
      'Question with multiple choice'
    when 'SingleOptionQuestion'
      'Question with single choice'
    else
      'Question without choice'
    end
  end
end
