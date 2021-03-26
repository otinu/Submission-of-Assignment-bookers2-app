class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      #ここから手動で追記=============================================
      t.string :profile_image_id
      t.string :title
      t.text :body
      #ここまで手動で追記=============================================

      t.timestamps
    end
  end
end
