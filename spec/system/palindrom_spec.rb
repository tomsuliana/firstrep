require 'rails_helper'

RSpec.describe 'Static content', type: :system do
  let (:digit) {78}
  scenario 'normal working' do
    visit root_path
    fill_in :digit, with: digit
    find('#palindrom-btn').click
    expect(find('#number-container')).to have_text("Количество: 6")  
  end
  scenario 'fill nothing in form and click submit' do
    visit root_path
    fill_in :digit, with: ''
    find('#palindrom-btn').click
    expect(find('#error-result')).to have_text('Empty string')
  end
  scenario 'fill wrong values in form and click submit' do
    visit root_path
    fill_in :digit, with: 'uuu'
    find('#palindrom-btn').click
    expect(find('#error-result')).to have_text('Enter numbers only')
  end
end