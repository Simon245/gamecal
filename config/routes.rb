Gamecal::Application.routes.draw do

  root 'site#index'

  #Site

  get 'privacy' => 'site#privacy'
  get 'terms' => 'site#terms'


  # Event

  get 'event' => 'event#index'




end
