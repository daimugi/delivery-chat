class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  
  def index
    @users = User.order(id: :desc).page(params[:page]).per(20)
  end

  def show
    @user = User.find(params[:id])
    @current_user_entry = Entry.where(user_id: current_user.id)
    @user_entry = Entry.where(user_id: @user.id)
    unless @user.id == current_user.id 
      @current_user_entry.each do |cu|
        @user_entry.each do |u|
          if cu.room_id == u.room_id then 
            @isRoom = true
            @roomID = cu.room_id
          end 
        end 
      end  
      if @isRoom 
      else
        @room =Room.new
        @entry = Entry.new
      end
    end  
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:successs] = 'ユーザーを登録しました'
      redirect_to @user
    else 
      flash.now[:danger] = 'ユーザーの登録に失敗しました'
      render :new
    end  
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end 
  
end
  
