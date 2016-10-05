require 'rails_helper'

feature "visitors can see list of reviews for the location" do
  scenario "sees reviews for specific location" do
    dumpling_king = Location.create(name_of_location: 'Dumpling King', description: "Great place for a cheap date, but not a first date")
    review_for_dumpling_king = Review.create(intimacy_rating: 2, reasoning: "It's more of a cafeteria, so not super romantic", location: dumpling_king)

    visit location_path(dumpling_king)

    expect(page).to have_content dumpling_king.name_of_location
    expect(page).to have_content review_for_dumpling_king.intimacy_rating
    expect(page).to have_content review_for_dumpling_king.reasoning
  end

  scenario "does not see other reviews for other locations" do
    dumpling_king = Location.create(name_of_location: 'Dumpling King', description: "Great place for a cheap date, but not a first date")
    review_for_dumpling_king = Review.create(intimacy_rating: 2, reasoning: "It's more of a cafeteria, so not super romantic", location: dumpling_king)
    rock_bottom = Location.create(name_of_location: "Rock Bottom", description: "Best last chance. Worst date spot ever")
    review_for_rock_bottom = Review.create(intimacy_rating: 1, reasoning: "You'll probably never see her again", location: rock_bottom)

    visit location_path(rock_bottom)

    expect(page).to have_content rock_bottom.name_of_location
    expect(page).to have_content review_for_rock_bottom.intimacy_rating
    expect(page).to have_content review_for_rock_bottom.reasoning

    expect(page).not_to have_content dumpling_king.name_of_location
    expect(page).not_to have_content review_for_dumpling_king.intimacy_rating
    expect(page).not_to have_content review_for_dumpling_king.reasoning
  end
end
