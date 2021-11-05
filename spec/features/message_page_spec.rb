feature 'message_page' do 

  scenario 'page is retrievable' do
    visit('/message_page')
    
    expect(page).to have_content 'Welcome'

  end 

end 