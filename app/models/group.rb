class Group < ApplicationRecord
  belongs_to :major_teacher, class_name: 'Teacher'
  has_and_belongs_to_many :teachers, join_table: 'groups_users', association_foreign_key: 'user_id'

  has_many :students, dependent: :nullify
  has_many :visibilities
  has_many :visible_subjects, through: :visibilities, source: :subject

  validates_presence_of :name
end
