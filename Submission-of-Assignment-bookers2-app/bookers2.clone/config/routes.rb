Rails.application.routes.draw do
  # ここから手動で追記=============================================
  root 'homes#top'
  get 'home/about' => 'homes#about', as: 'about'
  devise_for :users

  resources :books, only: [:index, :show, :create, :update, :edit, :destroy] do
    resources :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  resources :users, only: [:index, :show, :edit, :update]
  patch 'users_path' => 'users#show'

  resources :users do
    member do
      get :follows, :followers
    end
  end

  resources :relationships, only: [:create, :destroy]

  # ここまで手動で追記=============================================
end
