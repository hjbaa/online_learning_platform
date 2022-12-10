class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :title, default: ''
      t.integer :seconds_for_passage, null: true, default: nil
      t.references :author, null: false, foreign_key: { to_table: :users, column: :id }
      t.references :testable, polymorphic: true
      t.timestamps
    end
  end
end
