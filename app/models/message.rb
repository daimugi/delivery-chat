class Message < ApplicationRecord
  
  
  # with_options presence: true, if: :empty do
  # validates :content
  # validates :image
  # end
  
  belongs_to :user
  belongs_to :room
  mount_uploader :image, ImageUploader
  
  # def empty 
  #   @message = Message.find_by(content: '', image: '')
  #   if !@message.content? && !@message.image?
  #     flash[:alert] = 'メッセージが送信できませんでした'
  #   end  
  # end
  
  
end
