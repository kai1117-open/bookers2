class UsersController < ApplicationController
  def index
    @users = User.all  # ユーザーの全てのレコードを取得
  end

  def show
    @user = User.find(params[:id])  # 特定のユーザーを取得
    @post_images = @user.post_images 
  end

  def edit
    @user = User.find(params[:id])  # 編集するユーザーを取得
  end
  
  def user_params
    params.require(:user).permit(:image, :introduction)
  
end
