class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
  
  private
  
  def checkSession
    if !(session[:user_id])
      redirect_to new_session_path, notice:'loginしてください。'
    end 
  end
  
  def user_have_current
    if current_user.present?
      @user = User.find(current_user.id)
      p @user
    end
  end
  
end
