class UsersController < ApplicationController

  def index 
    
  end
  
  def new
    @user = User.new
  end
  
  def create 
    @user = User.new(user_params)
    p @user
    if @user.save
      redirect_to user_path(@user.id)
    else
      render 'users/new'
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    p @user
    if @user.update(user_params)
      
      redirect_to user_path
    else
      logger.debug @user.errors.inspect
      redirect_to edit_user_path(current_user.id)
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:icon_image, :user_image_cache, :name, :authority, :email, :password )
  end
end