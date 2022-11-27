class Subject < ApplicationRecord
  has_many :articles
  has_many :tests
end
