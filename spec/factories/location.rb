# frozen_string_literal: true
require 'factory_girl'

FactoryGirl.define do
  factory :location do
    sequence(:name_of_location) { |n| "thisplace#{n}" }
    sequence(:description) { |n| "This is a great description#{n}" }
  end
end
