class Picture < ApplicationRecord
  validates :title, presence: true
  validates :image_name, presence: true
  validates :user_id, presence: true

end
