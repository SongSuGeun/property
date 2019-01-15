class SessionsController < ApplicationController
 
  def new
    puts('세션 뉴 진입')
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      # ログイン失敗した場合
      flash.now[:danger] = 'ログインに失敗しました'
      render 'new'
    end
  end

  def destroy 
    puts("디스트로이 진입")
    log_out
    #flash[:notice] = 'ログアウトしました'
    redirect_to new_session_path
  end
  
  
  
  
  
end
