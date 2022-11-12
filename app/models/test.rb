# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :author, class_name: 'Teacher'
  belongs_to :article, optional: true

  has_many :questions, dependent: :destroy

  accepts_nested_attributes_for :questions, reject_if: :all_blank
  #
  # def make_json
  #   Test.all.to_json(only: :title,
  #                    include: { questions: { only: :title, include: { answers: { only: %i[content correct] } } } })
  # end
end
