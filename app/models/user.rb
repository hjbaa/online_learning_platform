# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :test_passages, dependent: :destroy
  has_many :passed_tests, through: :test_passages, source: :test

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  validates :email, presence: true, uniqueness: true, format: URI::MailTo::EMAIL_REGEXP
  validates :name, presence: true
  validates :last_name, presence: true
  validates :type, inclusion: { in: %w[Teacher Student Admin] }

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
