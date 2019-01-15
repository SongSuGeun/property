class FavoritesController < ApplicationController
  
  def create
    puts("favorite create 컨트롤러 진입")
    p params[:id]
    favorite = current_user.favorites.create(property_id: params[:propertys_id])
    redirect_to favorite_list_favorites_path, notice: "ブログをお気に入り登録しました"
  end

  def destroy
    puts("favoirte destroy 컨트롤러 진입")
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to favorite_list_favorites_path, notice: "ブログをお気に入り解除しました"
  end
   
  def favorite_list
     puts("puts favorite_list 컨트롤러 진입")
     #@favorite = Favorite.find_by(user_id: current_user.id)
     #p @favorite
     #@property = Property.find_by(id: current_user.id)
  end
   
    
end
