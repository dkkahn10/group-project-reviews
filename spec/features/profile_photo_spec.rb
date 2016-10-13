require 'rails_helper'

feature 'profile picture' do
  let!(:user) { FactoryGirl.create(:user) }

  context 'As a user I visit a sign up page' do
    scenario 'and upload photo succesfully' do
      visit root_path
      click_link 'Sign Up'
      fill_in 'Username', with: 'newUser'
      attach_file 'user_profile_picture', "#{Rails.root}/spec/support/images/sample_bird.jpeg"
      fill_in 'Email', with: 'email@gmail.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_button 'Sign up'
      expect(page).to have_xpath(
        "//img[contains(@src,'sample_bird.jpeg')]"
      )
      expect(page).to have_content('Welcome! You have signed up successfully.')
      expect(page).to have_content('Sign Out')
    end
  end

  context 'A a user I visit my edit profile page' do
    scenario 'user uploads a profile picture successfully' do
      visit root_path
      click_link 'Sign In'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'

      click_link 'Profile'

      fill_in 'Current password', with: user.password
      attach_file 'user_profile_picture', "#{Rails.root}/spec/support/images/sample_bird.jpeg"
      click_button 'Update'

      expect(page).to have_xpath(
        "//img[contains(@src,'sample_bird.jpeg')]"
      )
    end

    scenario "So I can see my edit form" do
      visit root_path
      click_link 'Sign In'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
      click_link 'Profile'

      expect(page).to have_css("form")
    end
  end
end
