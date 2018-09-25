Rails.application.routes.draw do
  resources :user
  get  '/signup',  to: 'user#index'
  post '/signup', to: 'user#create'

  get '*path',    to: 'user#errorView'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  root 'sessions#new'
end
