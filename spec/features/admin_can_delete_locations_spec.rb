require 'rails_helper'
include Warden::Test::Helpers

feature 'admin can delete other users\' locations' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:admin) { FactoryGirl.create(:user, role: 'admin') }
  let!(:location) { FactoryGirl.create(:location) }
  scenario 'an admin can delete a location' do
    login_as(admin)
    visit location_path(location)
    click_link 'Edit Location'
    expect(page).to have_link 'Delete'
  end

  scenario 'an admin can successfully delete a location' do
    login_as(admin)
    visit location_path(location)
    click_link 'Edit Location'
    click_link 'Delete'

    expect(page).to have_content('Location was deleted')
    expect(page).to have_content('All Locations')
    expect(page).to_not have_content location.name_of_location
  end
end
