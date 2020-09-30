Rails.application.routes.draw do

  get '/auth/facebook/callback' => 'session#fb_create'

  resources :users, only: [:new, :create, :show]
  resources :gears, only: [:new, :create, :show, :index] do 
    resources :comments
  end
  # resources :comments

  root "static_pages#home"

  get '/signin', to: 'session#new'
  post '/signin', to: 'session#create'
  
  delete '/session', to: 'session#destroy'
  post '/rides', to: 'rides#create'
  
end
