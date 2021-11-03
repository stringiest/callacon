Rails.application.routes.draw do
  get 'sessions/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create]
  get '/logout', controller: 'sessions', action: 'destroy'
end
