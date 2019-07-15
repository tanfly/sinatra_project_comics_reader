class CreateComicUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :comic_users do |t|
      t.integer :comic_id
      t.integer :user_id
    endd
  end
end
