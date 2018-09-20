class AddImgDateToDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :details, :img_date, :text
  end
end
