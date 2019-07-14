Rails.application.routes.draw do
  devise_for :users
  root 'blogs#index'
  resources :blogs 
  resources :users, only: [:show]
  resources :tags
  post   '/like/:blog_id' => 'likes#like',   as: 'like'
  delete '/like/:blog_id' => 'likes#unlike', as: 'unlike'
end