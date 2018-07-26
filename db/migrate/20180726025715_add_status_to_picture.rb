class AddStatusToPicture < ActiveRecord::Migration[5.2]
  def change
    add_column :pictures, :status, :string, default: "none"
  end
end
