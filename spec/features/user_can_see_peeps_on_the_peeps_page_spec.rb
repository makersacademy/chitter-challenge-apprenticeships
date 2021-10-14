feature 'User can view peeps:' do
  scenario 'on the /peeps endpoint' do
    add_row_to_test_database
    visit('/peeps')
    expect(page).to have_content "This is a peep!"
  end
end
