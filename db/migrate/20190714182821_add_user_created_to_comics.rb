class AddUserCreatedToComics < ActiveRecord::Migration[5.2]
  def change
    add_column :comics, :user_created, :integer
  end
end
