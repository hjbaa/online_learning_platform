class Test < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
end
