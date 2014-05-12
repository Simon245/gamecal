Gamecal::Application.routes.draw do

  root 'site#index'

  #Site
  get 'privacy' => 'site#privacy'
  get 'terms' => 'site#terms'
  post '/auth/steam/callback' => 'site#auth_callback'



  # Event

  # get 'events' => 'events#index'
  # get 'events/new' => 'events#new'
  # post 'events' => 'events#create'

  resources :events


end
