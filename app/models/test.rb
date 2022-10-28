# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
end
