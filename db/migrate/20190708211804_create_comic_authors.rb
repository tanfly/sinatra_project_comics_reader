class CreateComicAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :comic_authors do |t|
      t.integer :comic_id
      t.integer :author_id
    end
  end
end
