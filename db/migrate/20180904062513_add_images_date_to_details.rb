class AddImagesDateToDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :details, :images_date, :text
  end
end
