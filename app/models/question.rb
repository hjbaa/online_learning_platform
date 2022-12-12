# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy

  accepts_nested_attributes_for :answers

  validates_presence_of :title, :type
  # TODO: Добавить валидацию на значения для тайп

  self.inheritance_column = :_type_disabled
end
