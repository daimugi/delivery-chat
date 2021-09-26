class ToppagesController < ApplicationController
  
  def index
    @users = User.order(id: :desc).page(params[:page]).per(12)
    if logged_in?
      @posts = Post.order(updated_at: :desc).page(params[:page])
      @posts_price = Post.order(price: :desc).page(params[:page])
      @posts_distance = Post.order(distance: :desc).page(params[:page])
      @posts.each do |post|
      post.distance = position(post.user)
      end
    end  
  end
end
