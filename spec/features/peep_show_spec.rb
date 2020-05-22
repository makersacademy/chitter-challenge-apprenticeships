require_relative '../setup_test_database'
require 'pg'

feature 'peep show' do
  scenario 'user can view all peeps at /peep_show' do
    add_row_to_test_database
    visit '/'
    click_link 'View All Peeps'
    expect(page).to have_content("This is a peep! #{Date.today}")
  end
end
