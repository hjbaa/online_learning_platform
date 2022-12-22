# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy
  has_many :test_passages, dependent: :destroy, foreign_key: 'current_question_id'

  accepts_nested_attributes_for :answers

  validates_presence_of :title, :type
  validates :type, inclusion: { in: %w[MultipleChoice SingleChoice NoChoice] }

  def correct_answers
    answers.where(correct: true)
  end

  self.inheritance_column = :_type_disabled
end
