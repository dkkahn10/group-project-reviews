require 'rails_helper'
include Warden::Test::Helpers

feature 'a user can upvote or downvote a review' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:location) { FactoryGirl.create(:location) }
  let!(:review) { FactoryGirl.create(:review, location: location) }
  let!(:review_2) { FactoryGirl.create(:review, location: location) }

  context 'a user views the reviews on a location\'s show page' do
    scenario 'user sees upvote and downvote options' do
      login_as(user)
      visit location_path(location)

      expect(page).to have_button('Upvote')
      expect(page).to have_button('Downvote')
    end

    scenario 'user upvotes a review' do
      login_as(user)
      visit location_path(location)
      click_button 'Upvote'

      expect(page).to have_content(review.upvote_count + 1)
      expect(page).to have_content(review.downvote_count)
    end

    scenario 'user downvotes a review' do
      login_as(user)
      visit location_path(location)
      click_button 'Downvote'

      expect(page).to have_content(review.upvote_count)
      expect(page).to have_content(review.downvote_count + 1)
    end

    scenario 'user upvotes a review and then changes their vote to a downvote' do
      login_as(user)
      visit location_path(location)
      click_button 'Upvote'
      click_button 'Downvote'

      expect(page).to have_content(review.upvote_count)
      expect(page).to have_content(review.downvote_count + 1)
      expect(page).to_not have_content(review.upvote_count + 1)
      expect(page).to_not have_content(review.downvote_count)
    end

    scenario 'user downvotes a review and then changes their vote to an upvote' do
      login_as(user)
      visit location_path(location)
      click_button 'Downvote'
      click_button 'Upvote'

      expect(page).to have_content(review.upvote_count + 1)
      expect(page).to have_content(review.downvote_count)
      expect(page).to_not have_content(review.upvote_count)
      expect(page).to_not have_content(review.downvote_count + 1)
    end

    scenario 'upvoting a review does not effect the votes of other reviews' do
      login_as(user)
      visit location_path(location)
      click_button 'Downvote'

      expect(page).to have_content(review.upvote_count + 1)
      expect(page).to have_content(review_2.upvote_count)
      expect(page).to_not have_content(review_2.upvote_count + 1)

    end

    scenario 'an unauthenticated user cannot upvote a review' do
      visit location_path(location)
      click_button 'Upvote'

      expect(page).to have_content('You need to sign in or sign up before continuing.')
      expect(page).to_not have_content(review.upvote_count + 1)
    end

    scenario 'an unauthenticated user cannot downvote a review' do
      visit location_path(location)
      click_button 'Downvote'

      expect(page).to have_content('You need to sign in or sign up before continuing.')
      expect(page).to_not have_content(review.downvote_count + 1)
    end
  end
end
