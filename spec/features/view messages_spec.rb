require './spec/setup_test_database'
require 'messages.rb'

feature 'Viewing messages' do 
    
  scenario 'User can see messages and dates' do 
    setup_test_database
    test1 = Messages.create(message: 'Test 1')

    visit('/messages')
    expect(page).to have_content('Test 1')
    expect(page).to have_content(test1.date)
  end 
        
end
