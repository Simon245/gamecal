Gamecal::Application.routes.draw do

  root 'site#index'

  get 'event' => 'site#event'
  get 'privacy' => 'site#privacy'
  get 'terms' => 'site#terms'

end
