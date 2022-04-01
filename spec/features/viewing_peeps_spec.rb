require_relative '../setup_test_database'

feature 'viewing peeps' do
  scenario 'the user can view peeps on the homepage with the date posted' do
    add_row_to_test_database
    visit('/')
    expect(page).to have_content "This is a peep! Posted on 2022-04-01."
  end
end
