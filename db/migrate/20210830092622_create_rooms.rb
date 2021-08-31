class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.references :user, foreign_key: true
      t.references :clerk, foreign_key: true

      t.timestamps
      
      t.index [:user_id, :clerk_id], unique: true
    end
  end
end
