require 'rails_helper'

feature 'a user can search for locations' do
  let!(:location) { FactoryGirl.create(:location) }

  scenario 'a user searches for a location name and is given results' do
    visit root_path
    fill_in 'Plan your next date', with: location.name_of_location
    click_button 'Search'

    expect(page).to have_link location.name_of_location
  end

  scenario 'a user searches for a location description and is given results' do
    visit root_path
    fill_in 'Plan your next date', with: location.description
    click_button 'Search'

    expect(page).to have_link location.name_of_location
  end
end
