Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  # get 'sessions/new'

  # get 'users/new'

  # get 'user/new'

  root 'static_page#home'
  get "/help", to:'static_page#help'
  get '/about', to:'static_page#about'
  get '/contact', to:'static_page#contact'
  get  '/signup',  to: 'users#new'
  post '/signup', to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  # RESTfulなUsersリソースで必要となるすべてのアクションが利用できるようになるのです
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:create, :new, :edit, :update]
  resources :microposts, only: [:create, :destroy]
end
