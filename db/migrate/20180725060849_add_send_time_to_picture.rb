class AddSendTimeToPicture < ActiveRecord::Migration[5.2]
  def change
    add_column :pictures, :send_time, :datetime
  end
end
