class CreateDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :details do |t|
      t.integer :page
      t.integer :layout
      t.string :image_id
      t.integer :album_id
      t.text :message

      t.timestamps
    end
  end
end
