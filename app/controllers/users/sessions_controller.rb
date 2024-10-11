# app/controllers/users/sessions_controller.rb
class Users::SessionsController < Devise::SessionsController
  protected

  def after_sign_in_path_for(resource)
    user_path(resource) # ログインしたユーザの詳細画面にリダイレクト
  end
end
