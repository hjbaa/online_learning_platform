# frozen_string_lite  ral: true

class Teacher < User
  has_and_belongs_to_many :controlled_groups, class_name: 'Group',
                                              join_table: 'groups_users',
                                              foreign_key: 'user_id'


  has_many :created_tests, class_name: 'Test', foreign_key: :author_id, dependent: :destroy
  has_many :created_articles, class_name: 'Article', foreign_key: :author_id, dependent: :destroy

  has_many :created_subjects, class_name: 'Subject', foreign_key: :author_id, dependent: :destroy
  has_many :created_groups, class_name: 'Group', foreign_key: :major_teacher_id

  def author_of?(object)
    id == object.author_id
  end
end
