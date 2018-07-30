class AddFavariteToPicture < ActiveRecord::Migration[5.2]
  def change
    add_column :pictures, :favarite, :integer
  end
end
