Rails.application.routes.draw do
  root to: "homes#top"
  get 'homes/about', to: 'homes#about'

  devise_for :users
  resources :books
  resources :users # これで全てのアクションが有効になる
end
