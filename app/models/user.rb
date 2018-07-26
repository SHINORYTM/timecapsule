class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: {in:4..8}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: {with: VALID_EMAIL_REGEX}, allow_blank: true
  validates :password, presence: true, length: {in:6..8}

end
