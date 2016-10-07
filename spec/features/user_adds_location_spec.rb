require 'rails_helper'

feature "users can add location" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:location) { FactoryGirl.create(:location) }
  scenario "authenticated user adds new location successfully" do
    login_as(user)
    visit new_location_path
    expect(page).to have_content "New Location Form"

    fill_in 'Name of Location', with: location.name_of_location
    fill_in 'Description', with: location.description

    click_button "Add Location"

    expect(page).to have_content "New Location successfully added"
    expect(page).to have_content location.name_of_location
    expect(page).to have_content location.description
  end

  scenario "user does not provide proper information for a location" do
    login_as(user)
    visit new_location_path

    click_button "Add Location"

    expect(page).to have_content "Name of location can't be blank"
    expect(page).to have_content "Description can't be blank"
  end
end
