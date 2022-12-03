class CreateSubjects < ActiveRecord::Migration[6.1]
  def change
    create_table :subjects do |t|
      t.string :title, null: false
      t.index :title, unique: true
      t.text :description
      t.references :author, null: false, foreign_key: { to_table: :users, column: :id }

      t.timestamps
    end
  end
end
