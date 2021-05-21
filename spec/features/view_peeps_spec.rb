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
    setup_test_database
    add_row_to_test_database
    visit ('/peeps')
    expect(page).to have_content 'This is a peep!'

  end

end
