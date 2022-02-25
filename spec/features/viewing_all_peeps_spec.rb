require 'pg'

feature 'Visiting the index page' do
  scenario 'User visits the index page' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter!"
  end
end

feature 'Viewing all peeps' do
  scenario 'User can view all the peeps (messages)' do
    Peep.create(message: 'This is my first peep!')
    Peep.create(message: 'This is my second peep!')
    Peep.create(message: 'This is my third peep!')
    
    visit ('/peeps')

    expect(page).to have_content "This is my first peep!"
    expect(page).to have_content "This is my second peep!"
    expect(page).to have_content "This is my third peep!"
    
  end

  scenario 'User can view the date peeps were posted' do
    Peep.create(message: 'This is a peep!')

    visit ('/peeps')

    expect(page).to have_content Date.today.to_s
  end
end