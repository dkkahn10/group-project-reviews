Rails.application.routes.draw do
  root "locations#index"

  resources :locations do
    resources :reviews, only: [:index, :create, :new]
  end
end
