require 'pg'

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

# As a Maker
# So that I can let people know what I am doing  
# I want to post a message (peep) to chitter

feature 'Post a message' do
  scenario 'Posting a message to chitter' do
    visit('/new_message')
    fill_in('chit', with: 'I am posting my 1st chit')
    click_button('send')
    expect(page). to have_content('I am posting my 1st chit')
  end
end