class ApplicationController < ActionController::Base
  include SessionsHelper
  
  # def gon_user
  #   @user = User.find(params[:id])
  #   gon.user = @user
  # end  
  
  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
end
