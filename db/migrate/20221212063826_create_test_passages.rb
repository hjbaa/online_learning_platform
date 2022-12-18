class CreateTestPassages < ActiveRecord::Migration[6.1]
  def change
    create_table :test_passages do |t|
      t.references :user, null: false
      t.references :current_question, foreign_key: { to_table: :questions, column: :id }
      t.references :test, null: false, foreign_key: true
      t.boolean :success, default: false
      t.float :score, default: 0

      t.timestamps
    end
  end
end
