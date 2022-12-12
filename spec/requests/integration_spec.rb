require 'rails_helper'
require 'spec_helper'

RSpec.describe 'Static content', type: :system do
  scenario 'Register, login, calculate' do
    visit new_user_path
    fill_in :user_name, with: 'Alina'
    fill_in :user_password, with: 'alina'
    fill_in :user_password_confirmation, with: 'alina'
    click_button 'Create User'
    visit root_path
    fill_in :name, with: 'Alina'
    fill_in :password, with: 'alina'
    click_button 'Login'
    expect(page).to have_current_path example_input_path
    fill_in :digit, with: 78
    find('#palindrom-btn').click
    expect(find('#number-container')).to have_text("Количество: 6")  
  end
  scenario "doesn't allow non-logged in users to calculate values" do
    visit example_input_path
    expect(page).to have_current_path root_path
  end
  scenario "doesn't allow uncorecct password" do 
    visit new_user_path
    fill_in :user_name, with: 'Alina'
    fill_in :user_password, with: 'alina'
    fill_in :user_password_confirmation, with: 'alina'
    click_button 'Create User'
    visit root_path
    fill_in :name, with: 'Alina'
    fill_in :password, with: 'alina1'
    click_button 'Login'
    expect(page).to have_current_path root_path
    expect(find('#error')).to have_text('Wrong login or password')
  end
end