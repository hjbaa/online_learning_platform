# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_one :test
  has_rich_text :body
  has_many_attached :files

  validates :title, :body, presence: true

  before_destroy :destroy_attached_files

  scope :are_public, -> { where(type: 'Public') }

  self.inheritance_column = :_type_disabled
  accepts_nested_attributes_for :test, reject_if: :all_blank

  private

  def destroy_attached_files
    files.each(&:purge)
  end
end
