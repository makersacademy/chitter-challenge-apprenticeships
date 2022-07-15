feature 'messages' do
  scenario 'to have a messages on it' do
    visit '/messages'
    expect(page).to have_content "First message, Second message"
  end
end
