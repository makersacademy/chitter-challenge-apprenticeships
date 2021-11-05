require 'pg'
require 'message'

feature 'Opens a message page' do
  scenario 'Visits messages' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter"
    fill_in 'user_name', with: 'Scott'
    click_button 'Add Peep'
    expect(page).to have_content "Welcome to Chitter Scott"
    expect(page).to have_content "This is a peep!"
  end
end