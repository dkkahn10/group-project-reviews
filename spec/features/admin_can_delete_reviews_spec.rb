require 'rails_helper'
include Warden::Test::Helpers

feature 'an admin can delete a review if they deem it inappropriate' do
  let!(:admin) { FactoryGirl.create(:user, role: 'admin') }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:location) { FactoryGirl.create(:location) }
  let!(:review) { FactoryGirl.create(:review, location: location, user: user) }

  scenario 'an admin successfully deletes a review' do
    login_as(admin)
    visit location_path(location)
    click_link 'Edit Review'
    click_link 'Delete'


    expect(page).to have_content('Review was deleted')
    expect(page).to_not have_content review.reasoning
  end
end
