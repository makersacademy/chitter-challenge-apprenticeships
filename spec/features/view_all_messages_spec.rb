# User Story 1
# As a Maker
# So that I can see what people are doing
# I want to see all the messages (peeps)
# in a browser

require 'pg'

feature 'View all messages in browser' do
  scenario 'Browser shows all messages posted' do
   
    Message.create(message: 'Message 1')
    Message.create(message: 'Message 2')
    Message.create(message: 'Message 3')
    Message.create(message: 'Message 4')
    Message.create(message: 'Message 5')
  
    visit('/peeps')

  end
end
