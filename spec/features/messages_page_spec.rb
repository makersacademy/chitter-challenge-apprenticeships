require 'pg'
require 'message'

feature 'Opens a message page' do
  scenario 'Visits messages' do
    visit('/')
    PG.connect(dbname: 'chitter_test')
    Message.create(message: 'Hello World!')
    messages = Message.all
    expect(page).to have_content 'Hello World!'
  end
end