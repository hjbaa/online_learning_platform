class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.references :test, null: false, foreign_key: true
      t.string :type, null: false, default: 'MultipleOptionQuestion'
      t.timestamps
    end
  end
end
