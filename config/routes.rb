Rails.application.routes.draw do
  root 'home#index'
  resources :comments
  resources :posts
  resources :likes

  post '/' => 'posts#create'
  get '/profile' => 'users#index'
  get '/my_posts' => 'posts#mine'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
