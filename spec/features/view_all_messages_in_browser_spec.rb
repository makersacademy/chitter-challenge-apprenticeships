# User Story 1
# As a Maker
# So that I can see what people are doing
# I want to see all the messages (peeps)
# in a browser

feature 'View all messages from everyone in browser' do
  scenario 'browser shows all messages posted from everyone' do
    visit('/messages')

    expect(page).to have_content "Message 1 from user 1"
    expect(page).to have_content "Message 2 from user 2"
    expect(page).to have_content "Message 3 from user 3"
  end
end



