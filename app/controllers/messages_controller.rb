class MessagesController < ApplicationController
  
  before_action :require_user_logged_in, only: [:create]
  
  def create
    if Entry.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
      @message = Message.create(params.require(:message).permit(:user_id, :content, :room_id, :image).merge(user_id: current_user.id))
      if !@message.content? && !@message.image?
        flash[:alert] = 'メッセージが送信できませんでした'
      end  
    else
      flash[:alert] = 'メッセージが送信できませんでした'
    end 
    redirect_to "/rooms/#{@message.room_id}"
  end
end
