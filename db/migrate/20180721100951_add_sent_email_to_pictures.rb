class AddSentEmailToPictures < ActiveRecord::Migration[5.2]
  def change
    add_column :pictures, :sent_email, :string
  end
end
