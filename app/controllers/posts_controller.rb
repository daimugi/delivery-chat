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
  
  
  private

  def post_params
    params.require(:post).permit(:content, :price, :distance)
  end
end
