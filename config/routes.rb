Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :gears, only: [:new, :create, :show, :index] do 
    resources :comments, only: [:index, :new, :show]
  end

  root "static_pages#home"

  get '/signin', to: 'session#new'
  post '/signin', to: 'session#create'
  delete '/session', to: 'session#destroy'
  post '/rides', to: 'rides#create'
end
