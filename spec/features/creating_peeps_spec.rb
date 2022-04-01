feature 'Creating peeps' do
  scenario 'user can add peeps and dates' do
    setup_test_database

    Peeps.create(message: 'Test peep!', entry_date: "2021-03-18")
    Peeps.create(message: 'Second test peep!', entry_date: "2021-02-15")

    visit ('/peeps')

    expect(page).to have_content('Test peep!')
    expect(page).to have_content('Second test peep!')
    expect(page).to have_content("2021-03-18")
    expect(page).to have_content("2021-02-15")
  end
end