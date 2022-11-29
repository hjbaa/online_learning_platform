class Subject < ApplicationRecord
  has_many :articles, dependent: :nullify
  has_many :tests

  validates :title, presence: true, uniqueness: true
end
