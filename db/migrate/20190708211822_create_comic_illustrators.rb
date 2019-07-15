class CreateComicIllustrators < ActiveRecord::Migration[5.2]
  def change
    create_table :comic_illustrators do |t|
      t.integer :comic_id
      t.integer :illustrator_id
    end
  end
end
