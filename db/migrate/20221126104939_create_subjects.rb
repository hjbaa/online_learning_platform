class CreateSubjects < ActiveRecord::Migration[6.1]
  def change
    create_table :subjects do |t|
      t.string :title, null: false
      t.string :category, null: false

      t.timestamps
    end
  end
end
