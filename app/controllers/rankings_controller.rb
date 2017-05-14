class RankingsController < ApplicationController
  def like
    @ranking_counts = like.ranking
    
  end
end
