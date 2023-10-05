Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "posts#index"
  resources :posts

  resources :posts do
  resources :comments
  end

  resources :users, only: [:show]
  post "/users/:id/follow", to: "users#follow", as: "follow_user"


end
