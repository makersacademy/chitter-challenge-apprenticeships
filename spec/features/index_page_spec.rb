feature 'Display all messages' do
  scenario 'User can see all messages' do
    visit('/messages')
    expect(page).to have_content "First Message"
  end
end