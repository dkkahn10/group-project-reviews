# frozen_string_literal: true
require 'rails_helper'
feature 'sign up' do
  context 'As an unauthenticated user, I want to sign up' do
    scenario 'user signs up successfully' do

      visit root_path
      click_link 'Sign Up'
      fill_in 'Username', with: 'newUser'
      fill_in 'Email', with: 'email@gmail.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_button 'Sign up'

      expect(page).to have_content('Welcome! You have signed up successfully.')
      expect(page).to have_content('Sign Out')
    end

    scenario 'user leaves required field blank' do
      visit root_path
      click_link 'Sign Up'
      click_button 'Sign up'

      expect(page).to have_content('can\'t be blank')
      expect(page).to_not have_content('Sign Out')
    end

    scenario 'user password confirmation does not match' do
      visit root_path
      click_link 'Sign Up'
      fill_in 'Username', with: 'newUser'
      fill_in 'Email', with: 'email@gmail.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'banana'
      click_button 'Sign up'

      expect(page).to have_content('doesn\'t match')
      expect(page).to_not have_content('Sign Out')
    end
  end
end
