require 'spec_helper.rb'
require 'pg'

feature 'Testing the ability to add a message ' do
  scenario 'Can add a message' do
    connection = PG.connect(dbname: 'chitter_test')
    #connecting to test database as it's empty so can then add test data 
    visit('/add_peep')
    fill_in('message', with: 'A third peep')
    fill_in('date', with: '25th May')
    click_button('Submit')
    expect(page).to have_content('A third peep')
    expect(page).to have_content('25th May')
  end
end
