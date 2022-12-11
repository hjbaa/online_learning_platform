module Teacher::QuestionsHelper
  def allowed_types
    [
      ['Multiple option question', 'MultipleOptionQuestion'],
      ['Single option question', 'SingleOptionQuestion'],
      ['No option question', 'NoOptionQuestion']
    ]
  end
end
