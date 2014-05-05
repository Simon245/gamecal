Gamecal::Application.routes.draw do

  root 'site#index'

  get 'create' => 'site#create'

end
