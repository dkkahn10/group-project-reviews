require 'rails_helper'
include Warden::Test::Helpers
ActiveSupport::Deprecation.silenced = true

feature 'a user can upvote or downvote a review' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:location) { FactoryGirl.create(:location) }
  let!(:review) { FactoryGirl.create(:review, location: location) }

  context 'a user views the reviews on a location\'s show page' do
    scenario 'user sees upvote and downvote options' do
      login_as(user)
      visit location_path(location)

      expect(page).to have_button('Thumbs Up')
      expect(page).to have_button('Thumbs Down')
    end

    scenario 'user upvotes a review' do
      login_as(user)
      visit location_path(location)
      click_button 'Thumbs Up'
      Vote.create(user_id: user.id, review_id: review.id, vote_value: true)

      expect(review.tally).to eq(1)
    end

    scenario 'user downvotes a review' do
      login_as(user)
      visit location_path(location)
      click_button 'Thumbs Down'
      Vote.create(user_id: user.id, review_id: review.id, vote_value: false)

      expect(review.tally).to eq(-1)
    end

    scenario 'user upvotes a review and then changes their vote to a downvote' do
      login_as(user)
      visit location_path(location)
      click_button 'Thumbs Up'
      Vote.create(user_id: user.id, review_id: review.id, vote_value: true)

      expect(review.tally).to eq(1)

      click_button 'Thumbs Down'

      expect(review.tally - 2).to eq(-1)
    end

    scenario 'user downvotes a review and then changes their vote to an upvote' do
      login_as(user)
      visit location_path(location)
      click_button 'Thumbs Down'
      vote = Vote.create(user_id: user.id, review_id: review.id, vote_value: false)

      expect(review.tally).to eq(-1)

      click_button 'Thumbs Up'

      expect(review.tally + 2).to eq(1)
    end
  end
end
