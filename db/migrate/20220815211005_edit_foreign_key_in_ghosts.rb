class EditForeignKeyInGhosts < ActiveRecord::Migration[7.0]
  def change
    rename_column :ghosts, :users_id, :user_id
  end
end
