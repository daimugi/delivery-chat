class RemoveClerkFromRooms < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :clerks
  end
end
