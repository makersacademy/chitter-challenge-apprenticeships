feature 'Display all messages' do
  scenario 'User can see all messages' do
    visit '/post_message'
    fill_in 'peep', with: 'This is a peep!'
    click_button 'Submit'
    expect(page).to have_content ['This is a peep!']
  end
end
