Rails.application.routes.draw do
  resources :user
  resources :question
  resources :votes

  get  '/signup',  to: 'user#index'
  post '/signup', to: 'user#create'

  get '/home',    to:'user#home'
  post '/home',    to:'user#home'

  get '/logout', to: 'sessions#destroy'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'

  post '/addComment', to: 'comment#create'
  post '/add_answer', to: 'answer#create'

  post  '/add_question', to:'question#add_question'
  get  '/accept_answer', to:'answer#accept_answer'

  post 'vote/create',  to: 'votes_controller#create'

  get '*path',    to: 'user#errorView'

  root 'sessions#new'
end
