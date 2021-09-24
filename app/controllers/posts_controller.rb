class PostsController < ApplicationController
  
  before_action :require_user_logged_in
  
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = 'メッセージを投稿しました。'
      redirect_to root_url
    else
      flash[:notice] = 'メッセージの投稿に失敗しました。'
      redirect_to new_post_path
    end  
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = '投稿が更新されました'
      redirect_to root_url
    else
      flash[:notice] = '投稿が更新されませんでした'
      redirect_to edit_post_path(@post)
    end  
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = '配達依頼を削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  def address 
    @posts_address = Post.order(@distance: :desc).page(param[:page])
      @posts_address.each do |pa|
        
      lat1 = current_user.latitude
      lng1 = current_user.longitude
      lat2 = pa.user.latitude
      lng2 = pa.user.longitude
      
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
  
  private

  def post_params
    params.require(:post).permit(:content, :price)
  end
end
