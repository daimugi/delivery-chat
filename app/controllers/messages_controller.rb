class MessagesController < ApplicationController
  
  before_action :require_user_logged_in  
  
  def create
    if Entry.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
      @message = Message.create(params.require(:message).permit(:user_id, :content, :room_id).merge(user_id: current_user.id))
    else 
      flash[:alert] = 'メッセージが送信できませんでした'
    end 
    redirect_to room_path(@message.room.id)
  end
end
