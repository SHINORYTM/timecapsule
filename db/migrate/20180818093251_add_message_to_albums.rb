class AddMessageToAlbums < ActiveRecord::Migration[5.2]
  def change
    add_column:albums, :message, :text
  end
end
