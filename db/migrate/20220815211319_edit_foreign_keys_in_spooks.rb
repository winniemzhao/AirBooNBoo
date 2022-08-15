class EditForeignKeysInSpooks < ActiveRecord::Migration[7.0]
  def change
    rename_column :spooks, :ghosts_id, :ghost_id
    rename_column :spooks, :users_id, :user_id
  end
end
