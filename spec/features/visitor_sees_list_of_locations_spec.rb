require 'rails_helper'
require 'pry'

feature "visitor sees a list of locations" do
  scenario "sees a list of locations and link for new location" do
    dumpling_king = Location.create(name_of_location: "Dumpling King", description: "ok")
    rock_bottom = Location.create(name_of_location: "Rock Bottom", description: "gud.")

    visit locations_path

    expect(page).to have_content "Rock Bottom"
    expect(page).to have_link "Dumpling King"
    expect(page).to have_content "Add New Location"
  end

  scenario "clicks link and is taken to show page for given location" do
    dumpling_king = Location.create(name_of_location: 'Dumpling King', description: "Great place for a cheap date, but not a first date")

    visit root_path

    click_link "Dumpling King"
    expect(page).to have_content dumpling_king.name_of_location
    expect(page).to have_content dumpling_king.description
  end
end
