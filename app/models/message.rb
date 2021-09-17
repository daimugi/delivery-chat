class Message < ApplicationRecord
  # validates :content, presence: true
  belongs_to :user
  belongs_to :room
  mount_uploader :image, ImageUploader
end
