require_relative 'web_helper'

feature 'User can post to the page' do
  scenario 'user has the option to add a message' do
    visit "/Chitter"
    expect(page).to have_selector(:button, 'Add a peep')
  end
  scenario 'expect the peep to be added to the Chitter page' do
    submit_a_message
    expect(page).to have_content "This is my first post!"
  end
  scenario 'expect the peep to be added to the Chitter page' do
    submit_a_message
    fill_in :peep, with: "This is my second post!"
    click_button 'Add a peep'
    date = Time.now
    expect(page).to have_content "This is my second post!"
    expect(page).to have_content "This is my first post!"
    expect(page).to have_content "#{date.day}/#{date.month}/#{date.year}"
  end
end
