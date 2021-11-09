# As a Maker
# So that I can see what people are doing
# I want to see all the messages (peeps)
# in a browser
# require 'spec_helper'

feature 'views all messages' do
    scenario 'user views all messages' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps (message) VALUES('I am a frog')")
      visit '/messages'

      # fill_in('message', with: 'I am a frog!')
      # expect(page).to have_content "This is a peep!"
      expect(page).to have_content "I am a frog"
    end
end
