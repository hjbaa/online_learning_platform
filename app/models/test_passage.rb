# frozen_string_literal: true

class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :set_current_question

  def accept!(answers)
    self.score += calculate_question_result(answers)
    save!
  end

  def completed?
    current_question.nil?
  end

  def correct_percentage
    (score.to_f / test.questions.count * 100).round
  end

  def current_question_number
    test.questions.order(:id).where('id < ?', current_question.id).size + 1
  end

  def success?
    correct_percentage >= test.passing_score
  end

  def time_is_set?
    !test.seconds_for_passage.nil?
  end

  private

  def expired?
    time_is_set? && created_at + test.seconds_for_passage.seconds < Time.current
  end

  def next_question
    return test.questions.first if current_question.nil?
    return nil if expired?

    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def set_current_question
    self.current_question = next_question
  end

  def correct_answers
    current_question.correct_answers
  end

  def calculate_question_result(answers)
    case current_question.type
    when 'MultipleChoice'
      return 0 if (correct_answers.ids + answers.to_a.map(&:to_i)).uniq.sort != correct_answers.ids.sort

      (answers.to_a.size.to_f / correct_answers.size).round(2)
    when 'SingleChoice'
      return 1 if correct_answers.first.id == answers.to_i

      0
    else
      return 1 if correct_answers.first.content == answers

      0
    end
  end
end
