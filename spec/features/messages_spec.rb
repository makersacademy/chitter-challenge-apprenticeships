feature 'messages' do
  scenario 'see all messages in a browser' do
    visit('/messages')
    expect(page).to have_content 'This is a peep!'
  end

  scenario 'add a message' do
    visit('/add_message')
    fill_in('add', with: 'This is a test')
    click_button('Submit')
    visit('/messages')
    expect(page).to have_content 'This is a test'
  end
end

