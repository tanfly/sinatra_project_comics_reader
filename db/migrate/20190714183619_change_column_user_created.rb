class ChangeColumnUserCreated < ActiveRecord::Migration[5.2]
  def change
    change_column :comics, :user_created, :integer, :default => 0
  end
end
