class FavoritesController < ApplicationController
  def create
    @micropost = Micropost.find_by(id: params[:micropost_id])    # @
    current_user.favorite(@micropost)
    flash[:success] = 'お気に入り登録しました'
    #redirect_to microposts_path
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @micropost = Micropost.find_by(id: params[:micropost_id])
    current_user.unfavorite(@micropost)
    flash[:success] = 'お気に入り解除しました'
    #redirect_to microposts_path
    redirect_back(fallback_location: root_path)
  end
end
