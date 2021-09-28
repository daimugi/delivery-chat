class ToppagesController < ApplicationController
  
  def index
    @users = User.order(id: :desc).page(params[:page]).per(12)
    if logged_in?
      @posts = Post.order(updated_at: :desc).page(params[:page]).per(10)
      @posts_price = Post.order(price: :desc).page(params[:page]).per(10)
      @posts_distance = @posts.sort_by { |post| position(post.user).to_f }
      @posts_distance = Kaminari.paginate_array(@posts_distance).page(params[:page]).per(10)
    end
  end
end
