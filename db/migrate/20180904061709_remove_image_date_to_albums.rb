class RemoveImageDateToAlbums < ActiveRecord::Migration[5.2]
  def change
    remove_column :details, :image_date, :text
  end
end
