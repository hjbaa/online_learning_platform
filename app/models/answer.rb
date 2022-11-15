# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  validates :content, presence: true
  validate :validate_max_answer_amount, on: :create
  # validate :validate_max_correct_answer_amount, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def validate_max_answer_amount
    errors.add :base, :invalid_amount, message: 'Too many answers!' if question.answers.count >= 5
  end

  def validate_max_correct_answer_amount
    errors.add :base, :invalid_amount, message: 'Only one correct answer allowed!' if question.answers.where(correct: true).count != 1
  end
end
