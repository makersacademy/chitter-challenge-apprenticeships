feature 'Sort messages' do
  scenario 'Shows all bookmarks sorted by date' do
    Message.create(message: 'test_1')
    Message.create(message: 'test_2')
    Message.create(message: 'test_3')

    visit('/')
    click_button('Sort by date')
    
    expect(page).to have_content("test_1")

  end
end
