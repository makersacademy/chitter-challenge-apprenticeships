feature 'Adding a user' do
  scenario 'A user can be associated with a chitter' do
    visit('/messages/new')
    fill_in('user', with: 'Bob')
    fill_in('message', with: 'Hey there guys!')
    click_button('Submit')

    expect(page).to have_content('Bob', 'Hey there guys!')
  end
end