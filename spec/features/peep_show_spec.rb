require_relative '../setup_test_database'

feature 'peep show' do
  scenario 'user can view all peeps at /peep_show' do
    visit '/'
    click_link 'View All Peeps'
    expect(page).to have_content('This is a peep!')
  end
end
