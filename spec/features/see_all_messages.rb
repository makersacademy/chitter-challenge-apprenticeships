require 'spec_helper.rb'
require 'pg'
feature 'The ability to see all the messages' do
  scenario 'returning a list of messages' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps VALUES(1, 'This is a peep!');")
    connection.exec("INSERT INTO peeps VALUES(2, 'This is another peep!');")
    # adding test data which will be shown on /message page
    visit ('/messages')
    expect(page).to have_content("This is a peep! This is another peep!")
  end
end
