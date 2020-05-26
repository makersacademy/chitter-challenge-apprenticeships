feature 'create a new message' do
  scenario 'User is able to create a new message' do
    (visit '/messages/new')
    fill_in('message', with: 'Test peep!')
    click_button 'Post'
    expect(page).to have_content('Test peep!')
  end
end
