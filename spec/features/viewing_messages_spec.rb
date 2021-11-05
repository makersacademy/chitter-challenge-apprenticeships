feature 'view all messages' do
  scenario 'when visiting browser' do 
    visit('/messages')
    expect(page).to have_content "This is a test"
    expect(page).to have_content "Chitter Challenge"
  end 
end 