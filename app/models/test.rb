# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :author, class_name: 'Teacher'
  belongs_to :testable, polymorphic: true

  has_many :questions, dependent: :destroy

  accepts_nested_attributes_for :questions, reject_if: :all_blank
end
