feature 'adding a message' do
  scenario 'a user can add a message to chitter' do
    visit('messages/new')
    fill_in('message', with: 'I love capybaras!')
    click_button('Submit')
    expect(page).to have_content "I love capybaras!"
  end
end
