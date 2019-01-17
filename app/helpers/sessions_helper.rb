module SessionsHelper
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end 
  
  def current_userID
    @userID = User.find_by(id: session[:user_id])
  end 
  
  def logged_in?
    current_user.present?
  end
  
  def log_out
    session.delete(:user_id)
  end
  
end
