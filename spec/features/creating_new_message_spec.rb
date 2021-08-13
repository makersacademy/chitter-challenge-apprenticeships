feature 'Adding a new message' do
  scenario 'A user can add a message to Chitter' do
    visit('/messages/new')
    fill_in('message', with: 'I am using Chitter')
    click_button('Submit')

    expect(page).to have_content 'I am using Chitter'
  end
end