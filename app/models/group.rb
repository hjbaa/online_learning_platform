class Group < ApplicationRecord
  belongs_to :major_teacher, class_name: 'Teacher'

  has_many :teachers
  has_many :students
end
