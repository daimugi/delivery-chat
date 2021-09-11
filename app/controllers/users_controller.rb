class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :edit, :update]
  before_action :correct_user, only: [:edit, :update]
  
  
  def index
    @users = User.order(id: :desc).page(params[:page]).per(20)
  end

  def show
    @user = User.find(params[:id])
    gon.user = @user
    @current_user_entry = Entry.where(user_id: current_user.id)
    @user_entry = Entry.where(user_id: @user.id)
    unless @user.id == current_user.id 
      @current_user_entry.each do |cu|
        @user_entry.each do |u|
          if cu.room_id == u.room_id then 
            @isRoom = true
            @roomId = cu.room_id
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
    
  def edit
    @user = User.find(params[:id])
  end  
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'ユーザー情報が更新されました'
      redirect_to root_url
    else 
      flash.now[:danger] = 'ユーザー情報が更新されませんでした'
      render :edit
    end  
  end
  
  # def serch 
  #   latitude = params[:latitude]
  #   longitude = params[:longitude]
    
  #   @places = User.all.within(2, origin: [latitude, longitude])
  # end  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :address)
  end 
  
  def correct_user
    @user = current_user
    unless @user
      redirect_to root_url
    end  
  end  
  
end
  
