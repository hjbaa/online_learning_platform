# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'

  validates :title, :body, presence: true

  scope :are_public, -> { where(type: 'Public') }

  self.inheritance_column = :_type_disabled
end
