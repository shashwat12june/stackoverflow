Rails.application.routes.draw do
  resources :users
  resources :questions
  resources :votes
  resources :answers

  get  '/signup',  to: 'users#index'
  post '/signup', to: 'users#create'

  get '/home',    to:'users#home'
  post '/home',    to:'users#home'

  get '/logout', to: 'sessions#destroy'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'

  post '/addComment', to: 'comments#create'
  post '/add_answer', to: 'answers#create'

  post  '/add_question', to:'questions#add_question'
  get  '/accept_answer', to:'answers#accept_answer'

  post 'vote/create',  to: 'votes_controller#create'

  get '*path',    to: 'users#errorView'

  root 'sessions#new'
end
