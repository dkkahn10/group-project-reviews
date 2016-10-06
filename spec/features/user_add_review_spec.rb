require 'rails_helper'
include Warden::Test::Helpers

feature 'authenticated users can add reviews for the location' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:location) { FactoryGirl.create(:location) }

  scenario 'an authenticated user can navigate to the review form' do
    login_as(user)
    # dumpling_king = Location.create(name_of_location: 'Dumpling King', description: 'Great place for a cheap date, but not a first date')
    visit location_path(location)
    click_link 'Add a Review'

    expect(page).to have_content "Review Form for #{location.name_of_location}"
  end

  scenario 'adds a review for the location successfully' do
    login_as(user)
    visit location_path(location)
    click_link 'Add a Review'
    fill_in 'Intimacy Rating', with: 5
    fill_in 'Reasoning', with: 'great for a date'
    click_button 'Add Review'

    expect(page).to have_content 'Review added successfully'
    expect(page).to have_content location.name_of_location
    expect(page).to have_content 5
    expect(page).to have_content 'great for a date'
  end

  scenario 'adds a review for the location unsuccessfully' do
    login_as(user)
    visit location_path(location)
    click_link 'Add a Review'
    fill_in 'Intimacy Rating', with: 520
    click_button 'Add Review'

    expect(page).to have_content 'Rating must be between 1 - 5'
  end

  scenario 'an unauthenticated user cannot add a review'  do
    visit location_path(location)
    click_link 'Add a Review'

    expect(page).to have_content 'You need to sign in or sign up before continuing.'
    expect(page).to have_content 'Log in'
    expect(page).to_not have_content "Review Form for #{location.name_of_location}"
  end
end
