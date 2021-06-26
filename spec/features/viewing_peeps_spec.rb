feature 'Viewing peeps' do
  scenario 'A user can view peeps' do
    add_rows_to_test_database
    visit ('/')
    expect(page).to have_content('This is a peep!')
    expect(page).to have_content('Another peep!')
    expect(page).to have_content('One more peep!')
  end
end
    