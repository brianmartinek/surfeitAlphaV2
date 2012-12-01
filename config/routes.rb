Surfeitalpha::Application.routes.draw do
  get "feed/index"
  get "/authentications/index"

  match 'session/:action', :to => 'sessions'
  match '/sessions', :to => 'sessions#connect', :as => :instagram_access

  get '/' => 'pages#index', :as => :index
  get '/feed/welcome'

  get '/login' => 'sessions#login', :as => :login
  post '/sessions/create' => 'sessions#create_surfeit'
  match 'auth/twitter/callback', :to => 'sessions#create_twitter', :as => :twitter_auth
  # match 'auth/facebook/callback', :to => 'sessions#create_facebook', :as => :facebook_auth
  match 'auth/failure', :to => 'sessions#failure'

  get '/rss' => 'pages#rss'

  #users
  get '/current' => 'pages#current', :as => :user_current
  get '/sessions/logout' => 'sessions#destroy', :as => :logout

  
  resources :users 
  resources :stashes

  get '/authorizations' => 'authorizations#index', :as => :authorizations
end