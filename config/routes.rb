Rails.application.routes.draw do
  root to: "home#top"  # homesからhomeに変更
  get 'home/about', to: 'home#about'

  devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :books
  resources :users
end
