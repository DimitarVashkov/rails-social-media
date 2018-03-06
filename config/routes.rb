Rails.application.routes.draw do

  resources :friends, only: [:index, :destroy]
  resources :friend_requests
  root 'home#index'
  resources :comments
  resources :posts
  resources :likes

  get '/all_users' => 'users#all_users'
  post '/' => 'posts#create'
  get '/profile' => 'users#index'
  get '/my_posts' => 'posts#mine'

  devise_for :users

  resources :users, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
