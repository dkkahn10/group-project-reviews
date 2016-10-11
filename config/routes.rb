# frozen_string_literal: true
Rails.application.routes.draw do
  root "locations#index"

  resources :locations do
    resources :reviews, except: [:show, :index]
  end

  resources :reviews do
    resources :votes do
      member do
        post :upvote
        post :downvote
      end
    end
  end

  devise_for :users
end
