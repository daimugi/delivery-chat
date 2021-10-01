class Message < ApplicationRecord
  
  validates :content_or_image, presence: true
  
  
  belongs_to :user
  belongs_to :room
  mount_uploader :image, ImageUploader
  
  private
  
  def content_or_image
    content.present? || image.present?
  end
  
  
end
