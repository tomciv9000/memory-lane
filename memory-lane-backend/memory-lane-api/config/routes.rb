Rails.application.routes.draw do
 
  resources :places
  resources :spots
  resources :memories
  resources :sessions
  resources :users, only: [:create]
  #post '/login', to: 'auth#create'
  post 'login', to: 'auth#login'
  get 'auto_login', to: 'auth#auth_login'
  get 'user_is_authed', to: 'auth#user_is_authed'
  #get '/profile', to: 'users#profile'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
