class RecordsController < ApplicationController
  def new
  end

  def create
    email = params[:record][:email].downcase
    password = params[:record][:password]
    if login(email, password)
      flash[:success] = 'ログインしました'
      redirect_to @customer
    else
      flash.now[:danger] = 'ログインできませんでした'
      render :new
    end 
  end

  def destroy
    session[:customer_id] = nil
    flash[:success] = 'ログアウトしました'
    redirect_to root_url
  end
  
  
  private
  
  def login(email, password)
    @customer = User.find_by(email: email)
    if @customer && @customer.authenticate(password)
      session[:customer_id] = @customer.id
      return true
    else
      return false
    end
  end  
end
