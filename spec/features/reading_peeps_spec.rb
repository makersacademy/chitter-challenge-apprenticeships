require 'pg'

feature 'viewing all peeps' do
  scenario 'a user can see all the posted peeps' do
    setup_test_database
    add_row_to_test_database
    visit ('/peeps')
    expect(page).to have_content 'This is a peep!'
  end
end

# As a Maker
# So that I can easily see the latest peeps
# I want to see a list of peeps in reverse chronological order

feature 'puts posts/peeps in order' do
  scenario 'displays peeps in reverse chronological order' do
    add_peep('My first peep')
    add_peep('My new peep')

    expect(page.body.index('My new peep')).to be < page.body.index('My first peep')
  end
end
