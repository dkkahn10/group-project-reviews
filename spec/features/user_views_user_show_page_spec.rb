require 'rails_helper'
feature "user can visit a show page with edit and delete options" do
  context "As a user I want to visit my show page" do
    let!(:user) { FactoryGirl.create(:user) }
    
    scenario "So I can view my information" do
      visit root_path
      click_link 'Sign In'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
      click_link 'Your Profile'

      expect(page).to have_content(user.email)
      expect(page).to have_content(user.username)
    end
  end
end
