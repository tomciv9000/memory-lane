Rails.application.routes.draw do
 
  resources :places
  resources :spots
  resources :memories
  resources :sessions
  resources :users, only: [:create]
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
