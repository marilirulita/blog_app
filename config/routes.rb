Rails.application.routes.draw do
  devise_for :users
  root "users#index"
  get "/users/:id/api_token", to: "users#api_token", as: "api_token_user"
  
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] 
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create]
  end

  namespace :api do
    resources :users do
      resources :posts do
        resources :comments
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
