class SessionsController < ApplicationController
 
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      flash.now[:danger] = 'ログイン情報が間違います。'
      render 'new'
    end
  end

  def destroy 
    puts("@@@@@@@@@@@@@@@@@@@@@@@")
    log_out
    redirect_to new_session_path
  end
  
  
  
  
  
end
