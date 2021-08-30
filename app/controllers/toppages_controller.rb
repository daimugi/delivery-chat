class ToppagesController < ApplicationController
  def index
     @users = User.order(id: :desc).page(params[:page]).per(20)
  end
end
