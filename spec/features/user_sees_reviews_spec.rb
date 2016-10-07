require 'rails_helper'

feature "visitors can see list of reviews for the location" do
  let!(:location) { FactoryGirl.create(:location) }
  let!(:location_2) { FactoryGirl.create(:location) }
  let!(:review) { FactoryGirl.create(:review, location: location) }
  let!(:review_2) { FactoryGirl.create(:review, location: location_2) }

  scenario 'sees reviews for specific location' do
    visit location_path(location)

    expect(page).to have_content location.name_of_location
    expect(page).to have_content review.intimacy_rating
    expect(page).to have_content review.reasoning
  end

  scenario 'does not see other reviews for other locations' do
    visit location_path(location_2)

    expect(page).to have_content location_2.name_of_location
    expect(page).to have_content review_2.intimacy_rating
    expect(page).to have_content review_2.reasoning

    expect(page).not_to have_content location.name_of_location
    expect(page).not_to have_content review.reasoning
  end
end
