class UsersController < ApplicationController


  def index
    @users = User.all  # ユーザーの全てのレコードを取得
    @book_detail = Book.new
  end

  def show
    @user = User.find(params[:id])  # 特定のユーザーを取得
    @book_detail = Book.new
  end

  def edit
    
  user = User.find(params[:id])
  unless user.id == current_user.id
    flash[:notice] = "ID does not match."
    redirect_to users_path
  end
    
    @user = User.find(params[:id])  # 編集するユーザーを取得
  end
  
  
  def update
    @user = User.find(params[:id])  # ユーザーを検索
    if @user.update(user_params)     # データを更新
      flash[:notice] = "user successfully update."
      redirect_to @user
    else
      render :edit                    # エラーがあれば編集ページを再表示
    end
  end
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction) # ここで許可する属性を指定
  end
end