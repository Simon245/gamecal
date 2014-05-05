Gamecal::Application.routes.draw do

  root 'site#index'

  get 'create' => 'site#create'
  get 'privacy' => 'site#privacy'
  get 'terms' => 'site#terms'

end
