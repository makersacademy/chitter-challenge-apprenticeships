feature 'creating a new message' do
  scenario 'user can add a new message to the message board' do
    visit('/messageboard/new')
    fill_in('Name', with: 'Ted')
    fill_in('Message', with: 'Test Message 3')
    click_button('Submit')

    expect(page).to have_content('Ted - Test Message 3')
  end
end