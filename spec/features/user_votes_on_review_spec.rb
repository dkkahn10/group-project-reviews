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

      expect(review.tally).to eq(1)
      expect(page).to have_content(review.tally)
    end

    scenario 'user downvotes a review' do
      login_as(user)
      visit location_path(location)
      click_button 'Thumbs Down'

      expect(review.tally).to eq(-1)
      expect(page).to have_content(review.tally)
    end

    scenario 'user upvotes a review and then changes their vote to a downvote' do
      login_as(user)
      visit location_path(location)
      click_button 'Thumbs Up'

      expect(review.tally).to eq(1)
      expect(page).to have_content(review.tally)

      click_button 'Thumbs Down'

      expect(page).to have_content(review.tally)
      expect(page).to have_content(-1)
    end

    scenario 'user downvotes a review and then changes their vote to an upvote' do
      login_as(user)
      visit location_path(location)
      click_button 'Thumbs Down'

      expect(page).to have_content(-1)

      click_button 'Thumbs Up'

      expect(page).to have_content(review.tally)
      expect(page).to have_content(1)
    end

    scenario 'an unauthenticated user cannot upvote a review' do
      visit location_path(location)
      click_button 'Thumbs Up'

      expect(page).to have_content('You need to sign in or sign up before continuing.')
      expect(page).to_not have_content(1)
    end

    scenario 'an unauthenticated user cannot downvote a review' do
      visit location_path(location)
      click_button 'Thumbs Down'

      expect(page).to have_content('You need to sign in or sign up before continuing.')
      expect(page).to_not have_content(-1)
    end
  end
end
