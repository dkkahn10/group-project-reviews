require 'rails_helper'

feature "visitor sees a list of locations" do
  let!(:location) { FactoryGirl.create(:location) }
  let!(:location_2) { FactoryGirl.create(:location) }

  scenario "sees a list of locations and link for new location" do
    visit locations_path

    expect(page).to have_content location.name_of_location
    expect(page).to have_link location_2.name_of_location
    expect(page).to have_content "Add New Location"
  end

  scenario "clicks link and is taken to show page for given location" do
    visit root_path

    click_link location.name_of_location
    expect(page).to have_content location.name_of_location
    expect(page).to have_content location.description
  end
end
