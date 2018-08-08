class Image < ApplicationRecord
    mount_uploader :image, ImageUploader
    serialize :avatars, JSON # If you use SQLite, add this line.
end
