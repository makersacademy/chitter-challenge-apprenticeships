require_relative '../setup_test_database'


feature 'viewing peeps' do
  scenario 'the user can view peeps on the homepage' do
    add_row_to_test_database
    visit('/')
    expect(page).to have_content "This is a peep!"
  end
end
