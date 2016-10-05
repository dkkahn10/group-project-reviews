Rails.application.routes.draw do

    resources :locations, only: [:index, :new, :create, :show, :edit, :destroy] do
      resources :reviews, only: [:index, :new, :create]
  end

  root "locations#index"

end
