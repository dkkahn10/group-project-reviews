# frozen_string_literal: true
require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "coolCat101#{n}" }
    sequence(:email) { |n| "person#{n}@example.com" }
    sequence(:password) { |n| "password#{n}" }
  end
end
