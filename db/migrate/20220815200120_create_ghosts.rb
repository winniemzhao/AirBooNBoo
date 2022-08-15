class CreateGhosts < ActiveRecord::Migration[7.0]
  def change
    create_table :ghosts do |t|
      t.string :name
      t.string :spook_action
      t.boolean :is_active
      t.string :location
      t.text :description
      t.float :daily_rate
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
