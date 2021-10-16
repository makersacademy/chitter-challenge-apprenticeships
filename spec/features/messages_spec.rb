feature 'Viewing messages' do
  scenario 'A user can see messages' do
    add_row_to_test_database
    visit('/messages')
    expect(page).to have_content "This is a peep!"
  end

  scenario 'A user can see several messages' do
    add_row_to_test_database
    Database.add_message(text: 'This is a test!')
    visit('/messages')
    expect(page).to have_content "This is a peep!"
    expect(page).to have_content "This is a test!"
  end
end

feature 'add new message' do
  scenario 'using form' do
    visit('/messages/new')
    fill_in :message, with: 'This is a peep!'
    click_button 'Submit'
    expect(page).to have_current_path('/messages')
    expect(page).to have_content "This is a peep!"
  end
end
