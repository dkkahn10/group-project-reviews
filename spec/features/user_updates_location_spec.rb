require 'rails_helper'

feature "user can update/edit a location" do
  context "a user visits a show page for a location they have created" do
    context "a user clicks on an edit button and is taken to a update form" do
      scenario "a user edits a page successfully" do
        visit new_location_path
        fill_in "Name of Location", with: "The Temple of Time"
        fill_in "Description", with: "A blast from the past!"
        click_button "Add Location"
        click_link "Edit Location"
        fill_in "Description", with: "I lied! This place makes me feel old!"
        click_button "Edit"

        expect(page).to have_content "The Temple of Time"
        expect(page).to have_content "Add A Review"
      end
      scenario "a user edits a page unsuccessfully" do
        visit new_location_path
        fill_in "Name of Location", with: "The Temple of Time"
        fill_in "Description", with: "A blast from the past!"
        click_button "Add Location"
        click_button "Edit Location"
        fill_in "Name of Location", with: ""
        click_button "Edit"

        expect(page).to have_content "Description can't be blank"
        expect(page).to_not have_content "Add A Review"
      end
    end
  end
end
