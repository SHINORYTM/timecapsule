class Album < ApplicationRecord
    
  validates :title, presence: true
  validates :message, presence: true
  validates :user_id, presence: true
  validates :target_for, presence: true

  require 'date'

  def self.send_date?
    time = Time.now.strftime("%Y-%m-%d %H:%M")
    self.where(:status => "stand_by", :send_time => time)
  end

end
