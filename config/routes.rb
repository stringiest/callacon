Rails.application.routes.draw do
  root 'dashboard#index'
  
  get 'dashboard/index'

  get 'sessions/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create]
  get 'users/dashboard'

  resources :sessions, only: [:new, :create]
  get '/logout', controller: 'sessions', action: 'destroy'

  resources :bookings

  resources :games
end
