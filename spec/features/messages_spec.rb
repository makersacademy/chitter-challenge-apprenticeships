feature 'messages' do
  scenario 'see all messages in a browser' do
    visit('/messages')
    expect(page).to have_content 'This is a peep!'
  end
end
