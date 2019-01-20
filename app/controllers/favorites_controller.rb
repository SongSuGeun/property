class FavoritesController < ApplicationController
  
  def create
    p params[:id]
    favorite = current_user.favorites.create(property_id: params[:propertys_id])
    redirect_to favorite_list_favorites_path, notice: "お気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to favorite_list_favorites_path, notice: "お気に入り解除しました"
  end
   
  def favorite_list
     @favorite = Favorite.where(user_id: current_user.id)
     p @favorite
  end
   
    
end
