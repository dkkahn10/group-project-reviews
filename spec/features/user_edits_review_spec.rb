require 'rails_helper'
include Warden::Test::Helpers

feature 'user edits their review' do

  let!(:user) { FactoryGirl.create(:user) }
  let!(:user_2) { FactoryGirl.create(:user) }
  let!(:location) { FactoryGirl.create(:location) }
  let!(:review) {FactoryGirl.create(:review, location: location, user: user) }

  scenario 'a user can edit a review that they left on a location' do
    login_as(user)
    visit location_path(location)

    expect(page).to have_button("Edit Review")

  end

  scenario 'a user cannot edit another user\'s review' do
    login_as(user_2)
    visit location_path(location)

    expect(page).to_not have_button("Edit Review")
  end
end
