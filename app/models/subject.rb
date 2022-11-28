class Subject < ApplicationRecord
  has_many :articles
  has_many :tests

  validates_presence_of :title
  validates_uniqueness_of :title
end
