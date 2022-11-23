class ChangeUsersAndArticlesColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :type, :string, null: false, default: 'Student'
    add_column :users, :last_name, :string
    add_index :users, :type
    add_column :articles, :type, :string, null: false, default: 'Public'
    add_column :articles, :description, :string
  end
end
