require 'rails_helper'

feature 'sign up' do

  context 'As an unauthenticated user, I want to sign up' do

    scenario 'user signs up successfully' do

      visit root_path
      click_link 'Sign Up'
      fill_in 'Username', with: 'newUser'
      fill_in 'Password', with: 'password'
      fill_in 'Email', with: 'email@gmail.com'
      fill_in 'Confirm Password', with: 'password'
      click_button 'Sign Up'


      expect(page).to have_content("You have successfully signed up!")
      expect(page).to have_content("Sign Out")

    end

    scenario 'user leaves required field blank' do
      visit root_path
      click_link 'Sign Up'
      click_button 'Sign Up'

      expect(page).to have_content("cannot be blank")
      expect(page).to_not have_content("Sign Out")
    end

    scenario 'user password confirmation does not match' do
      visit root_path
      click_link 'Sign Up'
      fill_in 'Username', with: 'newUser'
      fill_in 'Password', with: 'password'
      fill_in 'Email', with: 'email@gmail.com'
      fill_in 'Password Confirmation', with: 'banana'
      click_button 'Sign Up'

      expect(page).to have_content('does not match')
      expect(page).to_not have_content("Sign Out")
    end
  end
end
