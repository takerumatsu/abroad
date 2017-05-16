class RankingsController < ApplicationController
  def like
    @likes_ranking = Like.group(:spot).order("count_spot desc").limit(10).count(:spot)
  end
end
