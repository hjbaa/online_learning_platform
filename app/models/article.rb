# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to :author, class_name: 'Teacher'
  belongs_to :subject

  has_one :test, as: :testable, dependent: :destroy
  has_rich_text :body
  has_many_attached :files

  validates :title, :body, presence: true

  before_destroy :destroy_attached_files

  scope :are_public, -> { where(type: 'Public') }

  self.inheritance_column = :_type_disabled

  private

  def destroy_attached_files
    files.each(&:purge)
  end
end
