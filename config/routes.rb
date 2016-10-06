# frozen_string_literal: true
Rails.application.routes.draw do
  root "locations#index"

  resources :locations do
    resources :reviews, except: [:show]
  end

  devise_for :users

  resources :users
end
