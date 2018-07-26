class Picture < ApplicationRecord
  validates :title, presence: true
  validates :image_name, presence: true
  validates :user_id, presence: true
  validates :sent_email, presence: true
  validates :send_time, presence: true

  require 'date'

  def user
    return User.find_by(id: self.user_id)
  end

  def self.send_date?
    time = Time.now.strftime("%Y-%m-%d %H:%M")
    self.where(:status => "stand_by", :send_time => time)
  end

end
