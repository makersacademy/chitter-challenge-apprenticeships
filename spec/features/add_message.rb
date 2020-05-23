require 'spec_helper.rb'
require 'pg'

feature 'Testing the ability to add a message ' do
  scenario 'Can add a message' do
    visit('/add_peep')
    fill_in('message', with:'A third peep')
    click_button('Submit')
    expect(page).to have_content('A third peep')
  end
end
