require 'pg'

feature 'go to homepage' do
  scenario 'visiting homepage' do
  visit '/'
    expect(page).to have_content 'WELCOME TO CHITTER!'
  end

feature 'Viewing list of peeps' do
  scenario 'I can see a list of peeps on homepage' do
  Peep.create(message: 'This is a peep!')
  visit('/')
    expect(page).to have_content('This is a peep!')
  end
end
end
