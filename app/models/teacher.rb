# frozen_string_lite  ral: true

class Teacher < User
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id, dependent: :destroy
  has_many :created_articles, class_name: 'Article', foreign_key: :author_id, dependent: :delete_all
end
