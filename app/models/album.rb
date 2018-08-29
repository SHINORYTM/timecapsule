class Album < ApplicationRecord
    
  validates :title, presence: true
  validates :message, presence: true
  validates :user_id, presence: true
  validates :target_for, presence: true

end
