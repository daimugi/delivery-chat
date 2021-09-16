class RoomsController < ApplicationController
  
  before_action :require_user_logged_in  
  
  def create
    @room = Room.create
    @entry1 = Entry.create(room_id: @room.id, user_id: current_user.id)
    @entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(room_id: @room.id))
    redirect_to "/rooms/#{@room.id}"
  end
  
  def index
    @users = User.order(id: :desc).page(params[:page]).per(20)
    @current_user_entry = Entry.where(user_id: current_user.id)
    @users_entry = Entry.where(user_id: @users.ids)
    unless @users.ids == current_user.id 
      @current_user_entry.each do |cu|
        @users_entry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end 
      end 
    end  
  end  

  def show
    @room = Room.find(params[:id])
    if Entry.where(user_id: current_user.id, room_id: @room.id).present?
      @messages = @room.messages
      @message = Message.new
      @entries = @room.entries
    else 
      redirect_back(fallback_location: root_path)
    end  
  end  
  
end
