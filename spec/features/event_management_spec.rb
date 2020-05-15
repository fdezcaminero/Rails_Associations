require 'rails_helper'
require 'date'

RSpec.describe "Events Management", type: :feature do
    before :each do
        User.create!(username:'example', email: 'user@example.com', password: 'password')
    end

    it 'is creating an event with valid input' do
        visit login_path
        fill_in 'Username', with: 'example'
        click_button 'Log In'
        visit events_path
        click_link 'Create Event'
        visit new_event_path
        fill_in 'Name', with: 'Example Party'
        fill_in 'Location', with: 'My house'
        fill_in 'Day', with: Date.today + 90
        fill_in 'Description', with: 'We will train you in the art of partying'
        click_button 'Create Event'
        visit events_path
        expect(page).to have_content('Example Party', 'My house')
    end
end