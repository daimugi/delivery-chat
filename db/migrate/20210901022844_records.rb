class Records < ActiveRecord::Migration[5.2]
  def change
    drop_table :clerks
    fail ActiveRecord::IrreversibleMigration
  end
end
