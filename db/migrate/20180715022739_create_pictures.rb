class CreatePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :pictures do |t|
      t.string :image_name
      t.integer :user_id
      t.string :title
      t.text :coment

      t.timestamps
    end
  end
end
