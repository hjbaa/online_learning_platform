module TestPassagesHelper
  def question_partial(question)
    case question.type
    when 'MultipleChoice'
      render partial: 'questions/multiple_choice', locals: { question: question }
    when 'SingleChoice'
      render partial: 'questions/single_choice', locals: { question: question }
    else
      render partial: 'questions/no_choice', locals: { question: question }
    end
  end

  def time_parser
    content_tag(:tr, class: 'table-info') do
      [
        # Часы
        content_tag(:td, (@test_passage.test.seconds_for_passage - (Time.current - @test_passage.created_at).seconds)
                           .round / 3600, id: 'h'),
        # Минуты
        content_tag(:td, ((@test_passage.test.seconds_for_passage - (Time.current - @test_passage.created_at).seconds)
                            .round / 60) % 60, id: 'm'),
        # Секунды
        content_tag(:td, (@test_passage.test.seconds_for_passage - (Time.current - @test_passage.created_at).seconds)
                           .round % 60, id: 's')
      ].reduce(&:+)
    end
  end
end
