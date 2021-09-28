class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :edit, :update]
  before_action :correct_user, only: [:edit, :update]
  before_action :distance, only: [:show]
  
  
  def index
    @users = User.order(id: :desc).page(params[:page]).per(8)
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
    # @post = current_user.posts.build
    @user_posts = Post.where(user_id: current_user.id).order(updated_at: :desc).page(params[:page]).per(10)
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
    if current_user == @user
      render :edit
    else 
      redirect_to root_url
    end  
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
  
  

  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :address, :introduction)
  end 
  
  def correct_user
    @user = current_user
    unless @user
      redirect_to root_url
    end  
  end  
  

  def distance
    @user = User.find(params[:id])
    
    lat1 = current_user.latitude
    lng1 = current_user.longitude
    lat2 = @user.latitude
    lng2 = @user.longitude
    
    x1 = lat1.to_f * Math::PI / 180
    y1 = lng1.to_f * Math::PI / 180
    x2 = lat2.to_f * Math::PI / 180
    y2 = lng2.to_f * Math::PI / 180
    
    radius = 6378.137
    
    diff_y = (y1 - y2).abs
    
    calc1 = Math.cos(x2) * Math.sin(diff_y)
    calc2 = Math.cos(x1) * Math.sin(x2) - Math.sin(x1) * Math.cos(x2) * Math.cos(diff_y)
    
    numerator = Math.sqrt(calc1 ** 2 + calc2 ** 2)
    
    denominator = Math.sin(x1) * Math.sin(x2) + Math.cos(x1) * Math.cos(x2) * Math.cos(diff_y)
    
    degree = Math.atan2(numerator, denominator)
    
    @distance = "#{(degree * radius).round(1)} km"
  end
  
end
  
