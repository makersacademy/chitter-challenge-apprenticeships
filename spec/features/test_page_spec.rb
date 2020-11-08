feature 'Viewing test page' do
  scenario 'visiting the test page' do
    visit('/test')
    expect(page).to have_content "Test page"
  end
end

# As a Maker
# So that I can see what people are doing
# I want to see all the messages (peeps)
# in a browser

feature 'Viewing all messages' do
  scenario 'Viewing a list of messages' do
    visit('/messages')
    expect(page).to have_content 'This is a peep!'
  end
end