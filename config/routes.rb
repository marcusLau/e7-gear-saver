Rails.application.routes.draw do
  resources :gears, only: [:new, :create, :show, :index]
  resources :users, only: [:new, :create, :show]

  root "static_pages#home"

  get '/signin', to: 'session#new'
  post '/signin', to: 'session#create'
  delete '/session', to: 'session#destroy'
  post '/rides', to: 'rides#create'
end
