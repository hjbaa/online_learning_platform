# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy

  accepts_nested_attributes_for :answers

  validates :title, presence: true
end
