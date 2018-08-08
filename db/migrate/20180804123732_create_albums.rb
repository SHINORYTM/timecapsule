class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.integer :user_id
      t.datetime :send_time
      t.string :target_for
      t.string :title
      t.string :status
      t.integer :favorite

      t.timestamps
    end
  end
end
