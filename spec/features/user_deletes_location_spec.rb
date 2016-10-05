require 'rails_helper'

feature "user can delete a location" do
  context "a user visits a show page for a location they have created" do
    context "a user clicks on an edit button and is taken to that form" do
      scenario "a user deletes a page successfully" do
        visit new_location_path
        fill_in "Name of Location", with: "The Temple of Time"
        fill_in "Description", with: "A blast from the past!"
        click_button "Add Location"
        click_link "Edit Location"
        click_link "Delete"

        expect(page).to_not have_content "The Temple of Time"
        expect(page).to have_content "All Locations"
        expect(page).to have_content "Location was deleted"
      end
    end
  end
end
