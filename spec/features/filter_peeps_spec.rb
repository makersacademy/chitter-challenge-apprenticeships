feature 'Filtering peeps' do
  scenario 'user can filter peeps by keyword' do
    setup_test_database

    Peeps.create(message: 'Test peep!', entry_date: "2021-03-18")
    Peeps.create(message: 'Second test peep!', entry_date: "2021-02-15")

    visit ('/peeps')
    fill_in('filter', with: 'peep')
    click_button "Filter"

    expect(page).to have_content("Test peep!")
    expect(page).to have_content("Second test peep!")
  end
end