class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :title, null: false, default: ''
      t.references :author, null: false, foreign_key: { to_table: :users, column: :id }
      t.timestamps
    end
  end
end
