require 'pg'

feature 'Viewing peeps' do
  scenario 'A user can see peeps' do

    # Add the test data
    Peep.create(message: 'This is a peep!')
    visit('/peeps')

    expect(page).to have_content "This is a peep!"
  end
end