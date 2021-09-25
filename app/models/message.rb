class Message < ApplicationRecord
  
  
  # with_options presence: true, if: :empty do
  # validates :content, presence: true, if: :confirm
  # validates :image, presence: true
  # end
  
  belongs_to :user
  belongs_to :room
  mount_uploader :image, ImageUploader
  
  # def confirm
  #   if @message.content.nil? && @message.image.nil?
  #   end  
  # end
  
  
end
