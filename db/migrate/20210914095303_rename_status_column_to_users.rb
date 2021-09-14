class RenameStatusColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :status, :introduction
  end
end
