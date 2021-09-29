class Message < ApplicationRecord
  
  validate :required_either_image_or_content
  
  belongs_to :user
  belongs_to :room
  mount_uploader :image, ImageUploader
  
  def required_either_image_or_content
    return if image.nil? && !content.empty?
    errors.add(:base, '画像または文字のどちらか一方で投稿可能です')
  end
  
  
end
