class Subject < ApplicationRecord
  has_many :articles, dependent: :destroy
  has_many :tests, dependent: :destroy
  belongs_to :author, class_name: 'Teacher'

  validates :title, presence: true, uniqueness: true

  has_rich_text :description
end
