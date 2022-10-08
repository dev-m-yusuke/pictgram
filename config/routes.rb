Rails.application.routes.draw do
  get 'topics/new'
  get 'sessions/new'
  root 'pages#index'
  resources :users
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  resources :users
  resources :topics

  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  delete 'favorites/' => 'favorites#destroy', as: 'destroy_favorite'
end
