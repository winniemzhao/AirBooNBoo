class AddDefaultToIsActiveInGhost < ActiveRecord::Migration[7.0]
  def change
    change_column_default :ghosts, :is_active, true
  end
end
