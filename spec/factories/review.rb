# frozen_string_literal: true
require 'factory_girl'

FactoryGirl.define do
  factory :review do
    intimacy_rating '3'
    sequence(:reasoning) { |n| "Cuz it was ok#{n}" }
    upvote_count 0
    downvote_count 0
    user
  end
end
