class Subject < ApplicationRecord
  has_many :articles, dependent: :nullify
  has_many :tests, dependent: :nullify
  belongs_to :author, class_name: 'Teacher'

  validates :title, presence: true, uniqueness: true

  has_rich_text :description
end
