class ChangeDatatypeImageOfMessages < ActiveRecord::Migration[5.2]
  def change
    change_column :messages, :image, :text
  end
end
