class AddSubjectRefToTest < ActiveRecord::Migration[6.1]
  def change
    add_reference :tests, :subject, foreign_key: true
  end
end
