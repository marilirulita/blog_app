Rails.application.routes.draw do
  devise_for :users
  root "users#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] 
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create]
  end

  namespace :api do
    resources :users, only: [:index, :show] do
      resources :posts, only: [:index, :show, :new] 
      resources :comments, only: [:index, :create]
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
