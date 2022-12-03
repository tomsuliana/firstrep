require 'rails_helper'

RSpec.describe 'Static content', type: :system do
  let (:digit) { Faker::Number.number(digits: 2)}
  scenario 'normal working' do
    visit root_path
    fill_in :digit, with: digit
    find('#palindrom-btn').click
    expect(find('#number-container')).to have_text("Количество: #{@arr.length}")
  end

  # scenario 'do not fill any values in form and click submit' do
  #   visit root_path
  #   find('#palindrom-btn').click
  #   end
end