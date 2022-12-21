# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :author, class_name: 'Teacher'
  belongs_to :testable, polymorphic: true

  has_many :questions, dependent: :destroy
  has_many :test_passages
  has_many :passed_users, class_name: 'User', through: :test_passages

  accepts_nested_attributes_for :questions, reject_if: :all_blank

  def questions_with_answers
    questions.where(id: Answer.pluck(:question_id).uniq)
  end
end
