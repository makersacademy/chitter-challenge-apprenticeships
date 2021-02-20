require 'pg'

feature 'view peeps' do
  scenario 'see all the messages (peeps) in a browser' do
    # TODO Edit parameters to show date: when doing 3rd user story
    Peep.create(message: 'New message! Woohoo!')
    visit('/show')
    expect(page).to have_content 'New message! Woohoo!'
  end
end
