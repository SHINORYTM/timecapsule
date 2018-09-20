class RemoveImageIdToDetails < ActiveRecord::Migration[5.2]
  def change
    remove_column :details, :image_id, :integer
  end
end
