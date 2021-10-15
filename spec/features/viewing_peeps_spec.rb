feature 'displays peeps' do
  scenario 'Displays a number of peeps' do
    add_rows_to_test_database

    visit('/peeps')
    expect(page).to have_content('This is my first peep!')
    expect(page).to have_content('User1')
    expect(page).to have_content('15/10/2021')
    expect(page).to have_content('This is my second peep!')
  end
end
