class AddDefaultToStatusInSpooks < ActiveRecord::Migration[7.0]
  def change
    change_column_default :spooks, :status, 0
  end
end
