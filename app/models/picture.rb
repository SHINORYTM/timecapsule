class Picture < ApplicationRecord
  validates :title, presence: true
  validates :image_name, presence: true
  validates :user_id, presence: true

  def user
    return User.find_by(id: self.user_id)
  end
end
