Rails.application.routes.draw do

  resources :locations, only: [:index, :new, :create, :show] do
    resources :reviews, only: [:index, :new, :create]
  end

  root "locations#index"

end
