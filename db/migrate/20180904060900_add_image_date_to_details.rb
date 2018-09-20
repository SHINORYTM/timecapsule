class AddImageDateToDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :details, :image_date, :text
  end
end
