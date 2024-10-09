class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_book  # 追加: 全てのページでフォームが使えるようにする

  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  def after_sign_out_path_for(resource)
    '/'
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end

  # 追加: 投稿フォーム用の新規オブジェクトを作成
  def set_book
    @book = Book.new(session[:book_params]) if session[:book_params]  # セッションからデータを取得
    session.delete(:book_params)  # セッションをクリア
  end
end
