class AddAuthorToArticle < ActiveRecord::Migration[6.1]
  def up
    add_belongs_to :articles, :author, foreign_key: { to_table: :users, column: :id }
  end

  def down
    remove_belongs_to :articles, :author
  end
end
