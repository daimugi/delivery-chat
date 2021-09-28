class ToppagesController < ApplicationController
  
  def index
    @users = User.order(id: :desc).page(params[:page]).per(12)
    if logged_in?
      @posts = Post.order(updated_at: :desc).page(params[:page]).per(10)
      @posts_price = Post.order(price: :desc).page(params[:page]).per(10)
      @posts_distance = Post.order(updated_at: :desc).page(params[:page]).per(10)
    end
  end
end
