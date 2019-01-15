class UsersController < ApplicationController

  def index 
    
  end
  
  def new
    puts("유저 뉴 진입")
    @user = User.new
  end
  
  def create 
    puts("유저 크리에이트 진입")
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render 'users/new'
    end
  end
  
  def show
    puts("유저 쇼 진입")
    @user = User.find(params[:id])
    #@user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:icon_image, :name, :authority, :email, :password )
  end
  
end