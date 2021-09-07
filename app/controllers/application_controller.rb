class ApplicationController < ActionController::Base
  include SessionsHelper
  
  # @user = User.find(params[:id])
  
  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
end
