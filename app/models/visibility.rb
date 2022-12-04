class Visibility < ApplicationRecord
  belongs_to :subject
  belongs_to :group

  validates_presence_of :subject, :group
end
