Rails.application.routes.draw do

  post '/users/index' => 'users#index'
  post '/posts/index' => 'posts#index'

  resources :users
  resources :posts
  resources :comments
  resources :addresses
end
