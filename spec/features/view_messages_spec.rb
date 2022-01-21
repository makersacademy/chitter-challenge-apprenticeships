require 'spec_helper'
require 'pg'

feature 'viewing messages' do
  scenario 'are on the page' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (message) VALUES ('Hi there');")
    connection.exec("INSERT INTO peeps (message) VALUES('How are you today?');")

    visit '/messages'
    expect(page).to have_content('Hi there')
    expect(page).to have_content('How are you today?')
end
end
