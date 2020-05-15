# rubocop:disable Metrics/BlockLength

require 'rails_helper'

RSpec.describe 'Authentication Management', type: :feature do
  context 'Signing Up' do
    it ':signs me up and sign me in with valid input' do
      visit new_user_path
      fill_in 'Username', with: 'example'
      fill_in 'Email', with: 'email@example.com'
      fill_in 'Password', with: 'password'
      click_button 'Sign up'
      visit events_path
      expect(page).to have_content('example')
    end

    it ':does not sign me up/sign me in with invalid input' do
      visit new_user_path
      fill_in 'Username', with: 'example'
      fill_in 'Email', with: ''
      fill_in 'Password', with: 'password'
      click_button 'Sign up'
      expect(page).to have_content("Email can't be blank")
    end

    it ':does not sign me up/sign me in with invalid input' do
      visit new_user_path
      fill_in 'Username', with: ''
      fill_in 'Email', with: 'email@example.com'
      fill_in 'Password', with: 'password'
      click_button 'Sign up'
      expect(page).to have_content("Username can't be blank")
    end

    it ':does not sign me up/sign me in with invalid input' do
      visit new_user_path
      fill_in 'Username', with: 'example'
      fill_in 'Email', with: 'email@example.com'
      fill_in 'Password', with: ''
      click_button 'Sign up'
      expect(page).to have_content("Password can't be blank")
    end
  end

  context 'Signing in' do
    before :each do
      User.create!(username: 'example', email: 'user@example.com', password: 'password')
    end

    it ':signs me in with valid input' do
      visit login_path
      fill_in 'Username', with: 'example'
      click_button 'Log In'
      visit events_path
      expect(page).to have_content('example')
    end

    it ':no sign in with invalid input' do
      visit login_path
      fill_in 'Username', with: ' '
      click_button 'Log In'
      expect(page).to have_content('Invalid username, please try again')
    end
  end
end

# rubocop:enable Metrics/BlockLength
