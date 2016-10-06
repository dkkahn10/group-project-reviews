require 'rails_helper'
include Warden::Test::Helpers

feature "visitors can add reviews for the location" do
  scenario "adds a review for the location successfully" do
    user = FactoryGirl.create(:user)
    login_as(user)
    dumpling_king = Location.create(name_of_location: 'Dumpling King', description: "Great place for a cheap date, but not a first date")

    visit location_path(dumpling_king)

    click_link "Add a Review"

    expect(page).to have_content "Review Form for Dumpling King"

    fill_in "Intimacy Rating", with: 5
    fill_in "Reasoning", with: "great for a date"
    click_button "Add Review"

    expect(page).to have_content "Review added successfully"
    expect(page).to have_content dumpling_king.name_of_location
    expect(page).to have_content 5
    expect(page).to have_content "great for a date"
  end

  scenario "adds a review for the location unsuccessfully" do
    user = FactoryGirl.create(:user)
    login_as(user)
    dumpling_king = Location.create(name_of_location: 'Dumpling King', description: "Great place for a cheap date, but not a first date")

    visit location_path(dumpling_king)

    click_link "Add a Review"
    expect(page).to have_content "Review Form for Dumpling King"

    fill_in "Intimacy Rating", with: 520
    click_button "Add Review"

    expect(page).to have_content "Rating must be between 1 - 5"
  end

  scenario 'an unauthenticated user cannot add a review'  do
    figaros = Location.create(name_of_location: 'Figaros', description: 'Italian stuff')

    visit location_path(figaros)
    click_link 'Add a Review'

    expect(page).to have_content 'You need to sign in or sign up before continuing.'
    expect(page).to have_content 'Log in'
    expect(page).to_not have_content 'Review Form for Figaros'
  end
end
