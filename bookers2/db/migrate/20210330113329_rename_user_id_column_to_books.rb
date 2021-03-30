class RenameUserIdColumnToBooks < ActiveRecord::Migration[5.2]
  def change
    rename_column :books, :user_id, :integer
    add_reference :books, :user, foreign_key: true
  end
end
