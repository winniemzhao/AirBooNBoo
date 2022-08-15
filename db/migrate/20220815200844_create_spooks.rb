class CreateSpooks < ActiveRecord::Migration[7.0]
  def change
    create_table :spooks do |t|
      t.date :start_date
      t.date :end_date
      t.float :total_price
      t.integer :status
      t.references :ghosts, null: false, foreign_key: true
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
