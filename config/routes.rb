Gamecal::Application.routes.draw do

  root 'site#index'

  #Site

  get 'privacy' => 'site#privacy'
  get 'terms' => 'site#terms'


  # Event

  # get 'events' => 'events#index'
  # get 'events/new' => 'events#new'
  # post 'events' => 'events#create'

  resources :events


end
