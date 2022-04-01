feature 'Reverse chronological peeps' do
  scenario 'user can see most recent peeps first' do
    setup_test_database

    Peeps.create(message: 'Test peep!', entry_date: "2021-03-18")
    Peeps.create(message: 'Second test peep!', entry_date: "2021-02-15")

    visit ('/peeps')

    click_button "View Newest First"

    page.body.index("2021-03-18").should < page.body.index("2021-02-15")
  end
end