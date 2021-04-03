Rails.application.routes.draw do

#ここから手動で追記=============================================
  root 'homes#top'
  get 'home/about' => 'homes#about', as: 'about'
  devise_for :users

  resources :books, only: [ :index,  :show, :create, :update, :edit, :destroy]

  resources :users, only: [:index, :show, :edit, :update]
  patch 'users_path' => 'users#show'
#ここまで手動で追記=============================================

end
