feature 'Shows messages' do
  scenario 'Shows all bookmarks on main page' do
    Message.create(message: 'test_1')
    Message.create(message: 'test_2')
    Message.create(message: 'test_3')

    visit('/')
    
    expect(page).to have_content("test_1")
    expect(page).to have_content("test_2")
    expect(page).to have_content("test_3")
    expect(page).to have_content("Posted at")
  end
end
