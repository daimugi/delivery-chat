module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def logged_in?
    !!current_user
  end 
  
  def current_customer
    @current_customer ||= Customer.find_by(id: session[:customer_id])
  end 
  
  def customer_logged_id?
    !!current_customer
  end
end
