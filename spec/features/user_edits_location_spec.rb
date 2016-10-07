# frozen_string_literal: true

require 'rails_helper'

feature 'user can update/edit a location' do
  context 'a user visits a show page for a location' do
    context 'a user clicks on an edit button and is taken to a update form' do
      let!(:user) { FactoryGirl.create(:user) }
      let!(:location) { FactoryGirl.create(:location) }

      scenario 'the user should be redirected to an edit form' do
        login_as(user)
        visit new_location_path
        fill_in 'Name of Location', with: 'Restaurant'
        fill_in 'Description', with: 'I love this place'
        click_button 'Add Location'
        click_link 'Edit Location'

        expect(page).to have_content('Location Edit Form')
        page.should have_field('Name of Location')
        page.should have_field('Description')
      end

      scenario 'when a user clicks the edit button, the location information should render in the form' do
        login_as(user)
        visit new_location_path
        fill_in 'Name of Location', with: 'Restaurant'
        fill_in 'Description', with: 'I love this place'
        click_button 'Add Location'
        click_link 'Edit Location'

        page.should have_field('Name of Location', with: 'Restaurant')
        page.should have_field('Description', with: 'I love this place')
      end

      scenario 'a user edits a page successfully' do
        login_as(user)
        visit new_location_path
        fill_in 'Name of Location', with: 'Restaurant'
        fill_in 'Description', with: 'I love this place'
        click_button 'Add Location'
        click_link 'Edit Location'
        fill_in 'Description', with: 'I lied! This place makes me feel old!'
        click_button 'Edit'

        expect(page).to have_content('Location was succesfully edited.')
        expect(page).to have_content('Restaurant')
        expect(page).to have_content('Reviews')
        expect(page).to_not have_content('I love this place')
      end

      scenario 'a user edits a page unsuccessfully' do
        login_as(user)
        visit new_location_path
        fill_in 'Name of Location', with: 'Restaurant'
        fill_in 'Description', with: 'I love this place'
        click_button 'Add Location'
        click_link 'Edit Location'
        fill_in 'Name of Location', with: ''
        click_button 'Edit'

        expect(page).to have_content('Name of location can\'t be blank')
        expect(page).to_not have_content('Review')
      end
    end
  end
end
