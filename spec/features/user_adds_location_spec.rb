require 'rails_helper'

# As an authenticated user
# I want to add an item
# So that others can review it

feature "users can add location" do
  scenario "authenticated user adds new location successfully" do
    visit new_location_path
    expect(page).to have_content "New Location Form"

    fill_in 'Name of location', with: "the place"
    fill_in 'Description', with: "was ok"

    click_button "Add Location"

    expect(page).to have_content "New Location successfully added"
    expect(page).to have_content "the place"
    expect(page).to have_content "was ok"
  end

  scenario "user does not provide proper information for a location" do
    visit new_location_path

    click_button "Add Location"

    expect(page).to have_content "Name of location can't be blank"
    expect(page).to have_content "Description can't be blank"
  end
end
