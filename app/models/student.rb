# frozen_string_literal: true

class Student < User
  belongs_to :group, optional: true
end
