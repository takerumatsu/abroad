class LikesController < ApplicationController
  before_action :require_user_logged_in, only: [:likes]
  def create
#    @spot = Spot.find_by(id: params[:spot])
    current_user.like(params[:spot])
    flash[:success] = 'Likeしました'
    redirect_to current_user
  end

  def destroy
#    @spot = Spot.find_by(id: params[:spost_id])
    current_user.unlike(@params[:spot])
#    current_user.unlike(@spost)
    flash[:success] = 'Likeを解除しました'
    redirect_to current_user
  end
end
