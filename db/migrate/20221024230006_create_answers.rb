class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.boolean :correct, null: false, default: false
      t.string :content, null: false
      t.text :description, default: ''
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
