class EditForeignKeyInReviews < ActiveRecord::Migration[7.0]
  def change
    rename_column :reviews, :spooks_id, :spook_id
  end
end
