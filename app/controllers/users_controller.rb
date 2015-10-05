class UsersController < ApplicationController
  before_action :show, only:[:edit, :update]
  
  def show #plofile
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(created_at: :desc)
    @followings = @user.following_users
    @followers = @user.follower_users
  end
  
  def new #sign up
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success]="Welcome to the sample App !"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    
  end
  
  def update
    if @user.update(user_params)
      # 保存に成功した場合はトップページへリダイレクト
      flash[:success]="Your edit has been reflected !"
      redirect_to current_user
    else
      # 保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
  end
  
  def followings
    @user=User.find(params[:id])
    @followings = @user.following_users
    @followers = @user.follower_users
  end
  
  def followers
    @user=User.find(params[:id])
    @followers = @user.follower_users
    @followings = @user.following_users
  end
  
  

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :city, :profile, :music)
  end
  
end
