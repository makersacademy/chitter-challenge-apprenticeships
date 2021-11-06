# As a Maker
# So that I can see what people are doing
# I want to see all the messages (peeps)
# in a browser
require 'pg'

feature 'views all messages' do
    scenario 'user views all messages' do
      visit '/messages'
      # expect(page).to have_content "This is a peep!"
      expect(page).to have_content "I am a frog"
    end
end
