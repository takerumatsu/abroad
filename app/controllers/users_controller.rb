class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show, :microposts]
  
  def show
    @user = User.find(params[:id])
    @likes = @user.likes
    @count_like = @user.likes.count
    
    #追加
    #@spot = current_user.like(params[:spot])
    #@like = current_user.like(params[:id)
    
    @microposts = @user.microposts.order('created_at DESC')
    counts(@user)
    
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = "ユーザ登録をしました"
      redirect_to @user
    else
      flash.now[:danger] = "ユーザ登録に失敗しました"
      render :new
    end
  end
  
  def microposts
    @user = User.find(params[:id])
    @microposts = @user.microposts
    counts(@user)
  end
  
  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
