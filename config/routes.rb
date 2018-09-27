Rails.application.routes.draw do
  resources :user
  resources :question

  get  '/signup',  to: 'user#index'
  post '/signup', to: 'user#create'

  get '/home',    to:'user#home'
  post '/home',    to:'user#home'

  get '/logout', to: 'sessions#destroy'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'

  post '/addComment', to: 'comment#create'
  post '/addAnswer', to: 'answer#create'

  post  '/addQuestion', to:'user#addQuestion'
  get  '/acceptAnswer', to:'answer#acceptAnswer'

  get '*path',    to: 'user#errorView'

  root 'sessions#new'
end
