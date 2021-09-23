class ToppagesController < ApplicationController
  
  def index
    @users = User.order(id: :desc).page(params[:page]).per(20)
    if logged_in?
      @posts = Post.order(id: :desc).page(params[:page])
      @posts_price = Post.order(price: :desc).page(params[:page])
    end  
  end
end
