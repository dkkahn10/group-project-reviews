require 'rails_helper'

feature 'sign in' do

  context 'as an authenticated user, I want to be able to sign in' do
    let!(:user) {FactoryGirl.create(:user)}

    scenario 'user signs in successfully' do

      visit root_path
      click_link 'Sign In'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign In'

      expect(page).to have_content("Sign Out")
      expect(page).to have_content("Welcome back")
    end

    scenario 'user does not sign in successfully' do
      visit root_path
      click_link 'Sign In'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: 'dogcatmeowwoof'
      click_button 'Sign In'

      expect(page).to have_content("Incorrect")
      expect(page).to_not have_content("Sign Out")
    end
  end
end
