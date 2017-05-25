class MicropostsController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :create, :destroy]
  before_action :correct_user, only: [:destroy]
  def index
    #@microposts = current_user.microposts.order('created_at DESC')
    @microposts = Micropost.order('created_at DESC')
    @user = current_user
  end

  def new
    if logged_in?
      @micropost = current_user.microposts.build  # form_for 用
    end
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = '投稿しました。'
      redirect_to microposts_path
    else
      @microposts = current_user.microposts.order('created_at DESC')
      flash.now[:danger] = '投稿に失敗しました。'
      render 'microposts/new'
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = '削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  
  private

  def micropost_params
    params.require(:micropost).permit(:content, :image, :image_cache, :remove_image)
  end
  
  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    unless @micropost
      redirect_to root_path
    end
  end
  
end
