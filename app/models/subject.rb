class Subject < ApplicationRecord
  belongs_to :author, class_name: 'Teacher'

  has_many :articles, dependent: :destroy
  has_many :tests, as: :testable, dependent: :destroy

  has_many :visibilities
  has_many :groups, through: :visibilities

  validates :title, presence: true, uniqueness: true

  has_rich_text :description
end
