feature 'view all messages' do
  scenario 'when visiting browser' do 
    visit('/messages')
    expect(page).to have_content "I love databases!"
    expect(page).to have_content "This is a chitter challenge"
  end 
end 