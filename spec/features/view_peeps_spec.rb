require 'pg'

# As a Maker
# So that I can see what people are doing
# I want to see all the messages (peeps) in a browser

feature 'view peeps' do
  scenario 'visit index page' do
    visit ('/')
    expect(page).to have_content "Chitter"
  end

  scenario 'allows user to view all peeps in a browser' do
    Peep.create(message: 'This is a peep!')
    visit ('/peeps')
    expect(page).to have_content 'This is a peep!'
  end
end

  # As a Maker
  # So that I can easily see the latest peeps
  # I want to see a list of peeps in reverse chronological order

feature 'lists latest peeps first' do
  scenario 'list of peeps in reverse chronological order' do
    add_peep('This is my first peep')
    add_peep('This is my latest peep')

    expect(page.body.index('This is my latest peep')).to be < page.body.index('This is my first peep')
  end
end
