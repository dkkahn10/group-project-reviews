Rails.application.routes.draw do

    resources :locations do 
      resources :reviews, only: [:index, :new, :create]
  end

  root "locations#index"

end
