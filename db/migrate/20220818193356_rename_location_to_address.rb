class RenameLocationToAddress < ActiveRecord::Migration[7.0]
  def change
    rename_column(:ghosts, :location, :address)
  end
end
