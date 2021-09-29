class ToppagesController < ApplicationController
  
  def index
    @users = User.order(id: :desc).page(params[:page]).per(12)
    if logged_in?
      @posts = Post.order(updated_at: :desc).page(params[:updated_at_page]).per(10)
      @posts_price = Post.order(price: :desc).page(params[:price_page]).per(10)
      @posts_distance = @posts.sort_by { |post| position(post.user).to_f }
      @posts_distance = Kaminari.paginate_array(@posts_distance).page(params[:distance_page]).per(10)
    end
  end
end
