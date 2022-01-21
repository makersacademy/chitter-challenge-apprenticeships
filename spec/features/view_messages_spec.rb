require 'spec_helper'

feature 'viewing messages' do
  scenario 'are on the page' do
    visit '/messages'
    expect(page).to have_content('Hi there')
    expect(page).to have_content('How are you today?')
end
end
