class Message < ApplicationRecord
  
  
  # with_options presence: true, if: :empty do
  # validates :content, presence: true, if: :empty?
  # validates :image
  # end
  
  belongs_to :user
  belongs_to :room
  mount_uploader :image, ImageUploader
  
  def empty?
    @message = Message.create(params.require(:message).permit(:user_id, :content, :room_id, :image).merge(user_id: current_user.id))
    if !@message.image? && !@message.content?
      flash[:notice] = "メッセージを送信できませんでした"
    end  
  end
  
  
end
