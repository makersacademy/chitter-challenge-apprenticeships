feature 'Viewing chitters' do
  scenario 'A user can see the messages' do
    visit '/messages'

    expect(page).to have_content "Hi there Paul hows the family?"  
    expect(page).to have_content "Hey Ryan yeah the family are doing well thanks"
  end
end