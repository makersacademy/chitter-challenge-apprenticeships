feature 'Viewing messages' do 
  scenario 'A user can view messages' do
    visit ('/messages')

    expect(page).to have_content "Message 1"

  end
end 
