# frozen_string_literal: true
Rails.application.routes.draw do
  root "locations#index"

  resources :users, only: [:index]
  resources :locations do
    resources :reviews, except: [:show, :index]
  end

  resources :reviews do
    member do
      post 'upvote', 'downvote'
    end
  end

  devise_for :users, controllers: { registrations: 'users/registrations' }
end
