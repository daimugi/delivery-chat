class AddDistanceToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :distance, :float
  end
end
