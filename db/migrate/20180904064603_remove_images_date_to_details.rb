class RemoveImagesDateToDetails < ActiveRecord::Migration[5.2]
  def change
    remove_column :details, :images_date, :text
  end
end
