# frozen_string_literal: true
Rails.application.routes.draw do
  root "locations#index"

  resources :locations do
    resources :reviews, except: [:show, :index]
  end

  resources :votes, only: [:update]

  devise_for :users
end
