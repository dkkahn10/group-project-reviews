require 'rails_helper'

feature 'profile picture' do
  let!(:user) { FactoryGirl.create(:user) }

  context 'As a user I visit a sign up page' do
    scenario 'and upload photo succesfully' do
      visit root_path
      click_link 'Sign Up'
      fill_in 'Username', with: 'newUser'
      attach_file "Profile picture", "#{Rails.root}/spec/support/images/photo.png"
      fill_in 'Email', with: 'email@gmail.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_button 'Sign up'

      expect(page).to have_content('Welcome! You have signed up successfully.')
      expect(page).to have_content('Sign Out')
    end

    scenario 'and upload photo unsuccesfully' do
      visit root_path
      click_link 'Sign Up'
      fill_in 'Username', with: 'newUser'
      attach_file "Profile picture", "photo"
      fill_in 'Email', with: 'email@gmail.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_button 'Sign up'

      expect(page).to_not have_content('Welcome! You have signed up successfully.')
      expect(page).to_not have_content('Sign Out')
    end
  end

  context 'A a user I visit my profile page' do
    scenario 'user uploads a profile picture successfully' do
      visit root_path
      click_link 'Sign In'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
      click_link 'Your Profile'
      attach_file 'Profile picture', '#{Rails.root}/spec/support/images/photo.png'
      click_button 'Update'

      expect(page).to have_css("img[src*='photo.png']")
      expect(page).to have_content("#{user.username}'s Profile'")
    end

    scenario 'user uploads a profile picture unsuccessfully' do
      visit root_path
      click_link 'Sign In'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
      click_link 'Your Profile'
      attach_file "Profile picture", "photo"
      click_button 'Update'

      expect(page).to have_css("img[src*='photo.png']")
      expect(page).to have_content("#{user.username}'s Profile'")
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

    xscenario "So I can delete/edit a profile photo" do
      visit root_path
      click_link 'Sign In'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
      click_link 'Your Profile'

    end
  end
end
