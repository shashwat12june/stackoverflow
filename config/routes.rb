Rails.application.routes.draw do
  resources :user
  resources :question
  resources :votes

  get  '/signup',  to: 'user#index'
  post '/signup', to: 'user#create'

  get '/home',    to:'question#home'
  post '/home',    to:'question#home'

  get '/logout', to: 'sessions#destroy'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'

  post '/addComment', to: 'comment#create'
  post '/addAnswer', to: 'answer#create'

  post  '/addQuestion', to:'question#addQuestion'
  get  '/acceptAnswer', to:'answer#acceptAnswer'

  post 'vote/create',  to: 'votes_controller#create'

  get '*path',    to: 'user#errorView'

  root 'sessions#new'
end
