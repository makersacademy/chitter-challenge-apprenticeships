
#failing test - not connecting successfully with test database

feature 'view all messages' do
  scenario 'when visiting browser' do 
    
    visit('/messages')

    expect(page).to have_content 'Chitter-Chatter!'
  
  end 
end 