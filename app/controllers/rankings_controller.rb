class RankingsController < ApplicationController
  def like
    @likes_ranking = Like.group(:spot).order("count_spot desc").limit(10).count(:spot)
  end
  
  def favorite
    @favorites_ranking = Favorite.group(:micropost_id).order("count_micropost_id desc").limit(10).count(:micropost_id)
  end
end
