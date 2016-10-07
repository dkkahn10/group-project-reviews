require 'rails_helper'

feature 'profile picture' do
  let!(:user) { FactoryGirl.create(:user) }

  context 'As a user I visit a sign up page' do
    scenario 'and upload photo succesfully' do
      visit root_path
      click_link 'Sign Up'
      fill_in 'Username', with: 'newUser'
      attach_file 'user_profile_picture', "#{Rails.root}/spec/support/images/LaunchHalloween16.jpg"
      fill_in 'Email', with: 'email@gmail.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_button 'Sign up'
      expect(page).to have_xpath(
      "//img[contains(@src,'LaunchHalloween16.jpg')]")
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
      click_link 'Your Profile'
      attach_file 'user_profile_picture', "#{Rails.root}/spec/support/images/photo.png"

      click_button 'Update'

      expect(page).to have_xpath(
       "//img[contains(@src,'/images/default_profile_picture.png')]"
       )
    end

    scenario "So I can see my edit form" do
      visit root_path
      click_link 'Sign In'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
      click_link 'Edit Your Profile'

      expect(page).to have_css("form")
    end
  end
end
