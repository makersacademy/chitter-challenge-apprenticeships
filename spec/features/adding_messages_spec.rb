
feature 'Adding a message' do
  scenario 'When a user adds a message it adds it to the db' do
    visit('/messages/new')
    fill_in('message', with: 'Wow, chitter is so amazing!')
    click_button('Submit')

    expect(page).to have_content 'Wow, chitter is so amazing!'
  end
end