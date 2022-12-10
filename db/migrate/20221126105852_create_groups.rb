class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.references :major_teacher, foreign_key: { to_table: :users, column: :id }

      t.timestamps
    end
  end
end
