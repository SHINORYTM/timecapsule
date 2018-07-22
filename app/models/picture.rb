class Picture < ApplicationRecord
  validates :title, presence: true
  validates :image_name, presence: true
  validates :user_id, presence: true
  validates :sent_email, presence: true

  def user
    return User.find_by(id: self.user_id)
  end
end
