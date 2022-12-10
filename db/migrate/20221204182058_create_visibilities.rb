class CreateVisibilities < ActiveRecord::Migration[6.1]
  def change
    create_table :visibilities do |t|
      t.references :subject, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.index %i[subject_id group_id], unique: true
      t.timestamps
    end
  end
end
