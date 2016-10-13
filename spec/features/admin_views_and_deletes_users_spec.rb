require 'rails_helper'
include Warden::Test::Helpers

feature 'admin can see a list of all of the site\'s users' do
  let!(:admin) { FactoryGirl.create(:user, role: 'admin') }
  let!(:user_1) { FactoryGirl.create(:user) }
  let!(:user_2) { FactoryGirl.create(:user) }
  let!(:user_3) { FactoryGirl.create(:user) }

  scenario 'admin successfully sees user index page' do
    login_as(admin)
    visit root_path
    click_link 'Admin Features'

    expect(page).to have_content('User Index Page')
    expect(page).to have_content user_1.username
    expect(page).to have_content user_2.username
    expect(page).to have_content user_3.username
  end

  scenario 'admin successfully deletes a user' do
    login_as(admin)
    visit root_path
    click_link 'Admin Features'
    click_link "Delete #{user_1.username}"

    expect(page).to have_content('Account successfully deleted')
  end
end
