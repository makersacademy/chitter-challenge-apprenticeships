require 'spec_helper'
require 'pg'

feature 'viewing messages' do
  scenario 'are on the page' do
    connection = PG.connect(dbname: 'chitter_test')
    Message.create(message:'Hi there')
    Message.create(message:'How are you today?')
   
    visit '/messages'
    expect(page).to have_content('Hi there')
    expect(page).to have_content('How are you today?')
end
end
