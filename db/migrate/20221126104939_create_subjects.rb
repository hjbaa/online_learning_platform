class CreateSubjects < ActiveRecord::Migration[6.1]
  def change
    create_table :subjects do |t|
      t.string :title, null: false
      t.index :title, unique: true

      t.timestamps
    end
  end
end
