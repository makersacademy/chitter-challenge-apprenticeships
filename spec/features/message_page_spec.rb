feature 'message_page' do 

  scenario 'page is retrievable' do
    visit('/message_page')
    
    expect(page).to have_content 'Welcome'

  end 

  scenario 'can view messages on page' do 
    add_row_to_test_database

    visit('/message_page')

    expect(page).to have_content 'This is a peep!'
  end 

end 