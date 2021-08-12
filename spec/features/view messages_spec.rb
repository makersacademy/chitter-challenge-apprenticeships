require './spec/setup_test_database'
require 'messages.rb'

feature 'Viewing messages' do 
  scenario 'A user can view messages' do
    setup_test_database

    Messages.create(message: 'This is a peep')
    Messages.create(message: 'Hello')
    Messages.create(message: 'World')

    visit ('/messages')

    expect(page).to have_content("This is a peep!")
    expect(page).to have_content("Hello")
    expect(page).to have_content("World")
  end
  
  scenario 'User can see messages and dates' do 
    test1 = Messages.create(message: 'Test 1')

    visit('/messages')
    expect(page).to have_content('Test 1')
    expect(page).to have_content(test1.date)
  end 
        
end
