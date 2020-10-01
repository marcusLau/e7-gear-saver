Rails.application.routes.draw do

  get '/auth/facebook/callback' => 'session#fb_create'

  resources :users, only: [:new, :create, :show]
  resources :gears do 
    resources :comments, only: [:new, :create, :show]
  end
  # resources :comments

  root "static_pages#home"

  get '/signin', to: 'session#new'
  post '/signin', to: 'session#create'
  
  delete '/session', to: 'session#destroy'
  post '/rides', to: 'rides#create'
  
end
