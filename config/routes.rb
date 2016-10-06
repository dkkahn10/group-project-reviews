# frozen_string_literal: true
Rails.application.routes.draw do
  root "locations#index"

  resources :locations do
    resources :reviews, only: [:index, :create, :new, :edit, :update]
  end

  devise_for :users

  resources :users

end
