Rails.application.routes.draw do
  resources :users
  resources :places
  resources :spots
  resources :memories
  resources :sessions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
