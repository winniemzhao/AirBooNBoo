class AddCoordinatesToGhosts < ActiveRecord::Migration[7.0]
  def change
    add_column :ghosts, :latitude, :float
    add_column :ghosts, :longitude, :float
  end
end
