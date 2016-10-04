Rails.application.routes.draw do

  resources :locations, only: [:index, :new, :create, :show]

  root "locations#index"

end
