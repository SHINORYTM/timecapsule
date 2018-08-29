class RemoveMessageToDetails < ActiveRecord::Migration[5.2]
  def change
    remove_column:details, :message, :text
  end
end
